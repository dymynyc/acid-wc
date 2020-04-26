(module
  (def ints    (import "acid-ints"))
  (def mem     (import "acid-memory"))
  (def strings (import "acid-strings"))

  (def read_request (system "system" "read_request" (id start bytes)))
  (def write_ready  (system "system" "write_ready"  (id start bytes)))
  (def open_request (system "system" "open_request" (id start bytes)))

  ;;HACK: global in main mem, TODO global vars
  (def total  (mem.alloc 4))
  (def lines  (mem.alloc 4))
  (def words  (mem.alloc 4))
  (def was_ws (mem.alloc 4))

  (def input_len 1024)
  (def input (mem.alloc input_len))

  (def incrs_mem (mac (ptr amt)
    &(i32_store $ptr (add (i32_load $ptr) $amt))
  ))

  [def count (fun count (start bytes) {block
    (incrs_mem total bytes)
    (def end (add start bytes))
    [loop (lte start end)
      {block
        (def char (i32_load8 start))
        {if (eq char 10) ;;newline
          (block
            (incrs_mem lines 1)
            (i32_store was_ws 1))

          (if (eq char 32) ;; space
            (i32_store was_ws 1)
            ;;neither newline or space
            (if (neq 0 (i32_load was_ws)) {block
              (incrs_mem words 1)
              (i32_store was_ws 0)
            })
          )
        }
        (set start (add start 1))
      }]
  })]

  [export read_ready (fun (id start bytes) (block
    (count start bytes)
    (loop
      (set bytes (read_request 0 input input_len))
      (count start bytes))
  ))]

  ;; the file read can error at anytime.
  ;; if it ends normally, read_ready length is zero?

  [export read_end (fun (id code)
    (if code
      ;;ah yeah this doesn't happen.
      ;;adding 4 to a string would fail if we had types
      (write_ready 2 (add 4 "ERROR!\n") 7)
      [block
        (def output
          ;;this could be more efficient...
          ;; it copies the strings each concat call
          ;; but varargs isn't implemented yet.
          ;; if it was, strings.concat could just be a macro
          ;; and then this would just be one copy
          (strings.concat
            (strings.concat (ints.encode (i32_load lines)) " ")
            (strings.concat
              (strings.concat (ints.encode (i32_load words)) " ")
              (strings.concat (ints.encode (i32_load total)) "\n")
            ) ))
        ;;normally, we'd also need to implement write_request
        ;;but because in this particular case we know  it's gonna
        ;;fit on one buffer
        (write_ready 1 (add output 4) (strings.length output))
      ]
    )
  )]

  (export ready (fun () (block
    ;;start as if there has been whitespace
    ;;so word count counts the first word
    (i32_store was_ws 1)
    (read_request 0 input input_len)
  )))
)
