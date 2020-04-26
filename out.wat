(module

  (import "system" "log" (func $log (param i32) (result i32)))
  (import "system"
    "read_request"
    (func $read_request
      (param i32) (param i32) (param i32) (result i32)))
  
  (memory (export "memory")
    1)
  (global $FREE (mut i32) (i32.const 0))
  (data 0
    (offset (i32.const 0))
    "\b6\04\00\00\t\00\00\00acid-ints\0b\00\00\00acid-memory\06\00\00\00system\0c\00\00\00read_request\06\00\00\00system\0b\00\00\00write_ready\06\00\00\00system\0c\00\00\00open_request\06\00\00\00system\03\00\00\00log\07\00\00\00ERROR!\n\01\00\00\00\n\0c\00\00\00acid-strings\01\00\00\000\0b\00\00\00acid-memory\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  
  (func $fun__6
    (param $size i32) (result i32)
    (local $free i32)
    (local $1 i32)
    (local $_free i32)
    (local.set $free (i32.load (i32.const 0)))
    (if
      (i32.eq (i32.const 0) (local.get $free))
      (then (local.set $1 (local.tee $free (i32.const 4))))
      (else (local.set $1 (i32.const 0))))
    (local.set
      $_free (i32.add (local.get $free) (local.get $size)))
    (i32.store (i32.const 0) (local.get $_free))
    (global.set 0
      (local.get $_free))
    (local.get $free))
  
  (func $fun__5
    (param $i i32) (result i32)
    (local $1 i32)
    (local $l i32)
    (local $5 i32)
    (local $3 i32)
    (local $i3 i32)
    (local $i2 i32)
    (local $L i32)
    (local $s__3 i32)
    (local $s i32)
    (local $j i32)
    (local $2 i32)
    (local $n i32)
    (if
      (i32.eq (i32.const 0) (local.get $i))
      (then (local.set $1 (i32.const 158)))
      (else (local.set $l (i32.const 0))
        (if
          (i32.lt_s (local.get $i) (i32.const 0))
          (then (local.set $5 (i32.mul (local.get $i) (i32.const -1))))
          (else (local.set $5 (local.get $i))))
        (local.set $3 (local.tee $i3 (local.get $5)))
        (local.set $i2 (local.get $3))
        (if
          (i32.eq (local.get $i) (i32.const 0))
          (then (local.set $1 (local.tee $l (i32.const 1))))
          (else (loop (if
              (i32.ne (i32.const 0) (local.get $i2))
              (then
                (local.set $i2 (i32.div_s (local.get $i2) (i32.const 10)))
                (local.set
                  $1 (local.tee $l (i32.add (i32.const 1) (local.get $l))))
              (br 1))))))
        (if
          (i32.lt_s (local.get $i) (i32.const 0))
          (then (local.set $5 (i32.const 1)))
          (else (local.set $5 (i32.const 0))))
        (local.set $3 (i32.add (local.get $l) (local.get $5)))
        (local.set $L (local.get $3))
        (local.set
          $s__3 (call $fun__6 (i32.add (i32.const 4) (local.get $L))))
        (i32.store (local.get $s__3) (local.get $L))
        (local.set $s (local.get $s__3))
        (local.set $j (i32.const 0))
        (if
          (i32.lt_s (local.get $i) (i32.const 0))
          (then (local.set $2 (i32.const 45))
            (i32.store8
              (i32.add (i32.const 4) (i32.add (local.get $s) (i32.const 0)))
              (local.get $2))
            (local.set $1 (local.get $2)))
          (else (local.set $1 (i32.const 0))))
        (loop (if
          (i32.lt_s (local.get $j) (local.get $l))
          (then
            (local.set $n (i32.rem_s (local.get $i3) (i32.const 10)))
            (local.set $i3 (i32.div_s (local.get $i3) (i32.const 10)))
            (local.set $2 (i32.add (i32.const 48) (local.get $n)))
            (i32.store8 (i32.add (i32.const 4)
                (i32.add (local.get $s)
                  (i32.sub
                    (local.get $L) (i32.add (local.get $j) (i32.const 1)))))
              (local.get $2))
            (local.set
              $1 (local.tee $j (i32.add (i32.const 1) (local.get $j))))
          (br 1))))
        (local.set $1 (local.get $s))
      )
    )
    (local.get $1)
  )
  
  (func $ready
     (result i32)
    
    (call
      $read_request (i32.const 0) (i32.const 182) (i32.const 1024)))
  
  (func $read_end
    (param $id i32) (param $code i32) (result i32)
    (local $1 i32)
    (if (local.get $code)
      (then (local.set $1 (call $log (i32.const 126))))
      (else
        (drop (call $log (call $fun__5 (i32.load (i32.const 178)))))
        (local.set $1 (call $log (i32.const 137)))))
    (local.get $1))
  
  (func $read_ready
    (param $id i32) (param $start i32) (param $bytes i32) (result i32)
    (local $2 i32)
    (local $1 i32)
    (local.set
      $2 (i32.add (i32.load (i32.const 178)) (local.get $bytes)))
    (i32.store (i32.const 178) (local.get $2))
    (loop (if
      (local.tee $bytes
        (call
          $read_request (i32.const 0) (i32.const 182) (i32.const 1024)))
      (then
        (local.set
          $2 (i32.add (i32.load (i32.const 178)) (local.get $bytes)))
        (i32.store (i32.const 178) (local.get $2))
        (local.set $1 (local.get $2))
      (br 1))))
    (local.get $1))
  
  (export "read_ready" (func $read_ready))
  (export "read_end" (func $read_end))
  (export "ready" (func $ready))
)
