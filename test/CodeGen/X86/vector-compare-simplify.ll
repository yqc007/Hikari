; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown | FileCheck %s

; Test simplifications of vector compares that should simplify to true, false or equality.

define <4 x i32> @slt_min(<4 x i32> %x) {
; CHECK-LABEL: slt_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp slt <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sge_min(<4 x i32> %x) {
; CHECK-LABEL: sge_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sge <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sgt_min(<4 x i32> %x) {
; CHECK-LABEL: sgt_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpgtd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sgt <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sle_min(<4 x i32> %x) {
; CHECK-LABEL: sle_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpgtd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sle <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sgt_max(<4 x i32> %x) {
; CHECK-LABEL: sgt_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sgt <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sle_max(<4 x i32> %x) {
; CHECK-LABEL: sle_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sle <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @slt_max(<4 x i32> %x) {
; CHECK-LABEL: slt_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483647,2147483647,2147483647,2147483647]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    movdqa %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp slt <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sge_max(<4 x i32> %x) {
; CHECK-LABEL: sge_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483647,2147483647,2147483647,2147483647]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sge <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ult_min(<4 x i32> %x) {
; CHECK-LABEL: ult_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ult <4 x i32> %x, zeroinitializer
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @uge_min(<4 x i32> %x) {
; CHECK-LABEL: uge_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp uge <4 x i32> %x, zeroinitializer
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ugt_min(<4 x i32> %x) {
; CHECK-LABEL: ugt_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor %xmm1, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ugt <4 x i32> %x, zeroinitializer
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ule_min(<4 x i32> %x) {
; CHECK-LABEL: ule_min:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483648,2147483648,2147483648,2147483648]
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    pcmpgtd %xmm1, %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ule <4 x i32> %x, zeroinitializer
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ugt_max(<4 x i32> %x) {
; CHECK-LABEL: ugt_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorps %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ugt <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ule_max(<4 x i32> %x) {
; CHECK-LABEL: ule_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ule <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ult_max(<4 x i32> %x) {
; CHECK-LABEL: ult_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ult <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @uge_max(<4 x i32> %x) {
; CHECK-LABEL: uge_max:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm2, %xmm2
; CHECK-NEXT:    pxor {{.*}}(%rip), %xmm0
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483647,2147483647,2147483647,2147483647]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    pxor %xmm2, %xmm1
; CHECK-NEXT:    movdqa %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp uge <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @slt_min_plus1(<4 x i32> %x) {
; CHECK-LABEL: slt_min_plus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp slt <4 x i32> %x, <i32 -2147483647, i32 -2147483647, i32 -2147483647, i32 -2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sge_min_plus1(<4 x i32> %x) {
; CHECK-LABEL: sge_min_plus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483649,2147483649,2147483649,2147483649]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sge <4 x i32> %x, <i32 -2147483647, i32 -2147483647, i32 -2147483647, i32 -2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sgt_max_minus1(<4 x i32> %x) {
; CHECK-LABEL: sgt_max_minus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sgt <4 x i32> %x, <i32 2147483646, i32 2147483646, i32 2147483646, i32 2147483646>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @sle_max_minus1(<4 x i32> %x) {
; CHECK-LABEL: sle_max_minus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpgtd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp sle <4 x i32> %x, <i32 2147483646, i32 2147483646, i32 2147483646, i32 2147483646>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ult_one(<4 x i32> %x) {
; CHECK-LABEL: ult_one:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor %xmm1, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ult <4 x i32> %x, <i32 1, i32 1, i32 1, i32 1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @uge_one(<4 x i32> %x) {
; CHECK-LABEL: uge_one:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor {{.*}}(%rip), %xmm0
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483649,2147483649,2147483649,2147483649]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp uge <4 x i32> %x, <i32 1, i32 1, i32 1, i32 1>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ugt_max_minus1(<4 x i32> %x) {
; CHECK-LABEL: ugt_max_minus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ugt <4 x i32> %x, <i32 -2, i32 -2, i32 -2, i32 -2>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ule_max_minus1(<4 x i32> %x) {
; CHECK-LABEL: ule_max_minus1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pcmpgtd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ule <4 x i32> %x, <i32 -2, i32 -2, i32 -2, i32 -2>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ugt_smax(<4 x i32> %x) {
; CHECK-LABEL: ugt_smax:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor %xmm1, %xmm1
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    movdqa %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ugt <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ule_smax(<4 x i32> %x) {
; CHECK-LABEL: ule_smax:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pcmpgtd %xmm1, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ule <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @ult_smin(<4 x i32> %x) {
; CHECK-LABEL: ult_smin:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpeqd %xmm1, %xmm1
; CHECK-NEXT:    pcmpgtd %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ult <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @uge_smin(<4 x i32> %x) {
; CHECK-LABEL: uge_smin:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pxor {{.*}}(%rip), %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm1
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    pcmpeqd %xmm0, %xmm0
; CHECK-NEXT:    pxor %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp uge <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

; Make sure we can efficiently handle ne smin by turning into sgt.
define <4 x i32> @ne_smin(<4 x i32> %x) {
; CHECK-LABEL: ne_smin:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pcmpgtd {{.*}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ne <4 x i32> %x, <i32 -2147483648, i32 -2147483648, i32 -2147483648, i32 -2147483648>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}

; Make sure we can efficiently handle ne smax by turning into sgt. We can't fold
; the constant pool load, but the alternative is a cmpeq+invert which is 3 instructions.
; The PCMPGT version is two instructions given sufficient register allocation freedom
; to avoid the last mov to %xmm0 seen here.
define <4 x i32> @ne_smax(<4 x i32> %x) {
; CHECK-LABEL: ne_smax:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movdqa {{.*#+}} xmm1 = [2147483647,2147483647,2147483647,2147483647]
; CHECK-NEXT:    pcmpgtd %xmm0, %xmm1
; CHECK-NEXT:    movdqa %xmm1, %xmm0
; CHECK-NEXT:    retq
  %cmp = icmp ne <4 x i32> %x, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %r = sext <4 x i1> %cmp to <4 x i32>
  ret <4 x i32> %r
}
