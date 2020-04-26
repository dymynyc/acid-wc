(module
  (def ints  (import "acid-ints"))
  (def mem   (import "acid-memory"))

  (def read_request (system "system" "read_request" (id start bytes)))
  (def write_ready  (system "system" "write_ready"  (id start bytes)))
  (def open_request (system "system" "open_request" (id start bytes)))

  (def log          (system "system" "log"          (string)))

  ;;HACK: global in main mem
  (def total (mem.alloc 4))

  (def input_len 1024)
  (def input (mem.alloc input_len))

  (export read_ready (fun (id start bytes) (block
    (i32_store total (add (i32_load total) bytes))
    (loop (set bytes (read_request 0 input input_len))
      (i32_store total (add (i32_load total) bytes)))
  )))

  ;; the file read can error at anytime.
  ;; if it ends normally, read_ready length is zero?

  (export read_end (fun (id code)
    (if code
      (log "ERROR!\n")
      (block (log (ints.encode (i32_load total))) (log "\n"))
    )
  ))

  (export ready (fun () (read_request 0 input input_len)))

)
