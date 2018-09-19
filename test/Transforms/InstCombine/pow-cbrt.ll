; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

define double @pow_intrinsic_third_fast(double %x) {
; CHECK-LABEL: @pow_intrinsic_third_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast double @llvm.pow.f64(double [[X:%.*]], double 0x3FD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call fast double @llvm.pow.f64(double %x, double 0x3fd5555555555555)
  ret double %pow
}

define float @powf_intrinsic_third_fast(float %x) {
; CHECK-LABEL: @powf_intrinsic_third_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast float @llvm.pow.f32(float [[X:%.*]], float 0x3FD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call fast float @llvm.pow.f32(float %x, float 0x3fd5555560000000)
  ret float %pow
}

define double @pow_intrinsic_third_approx(double %x) {
; CHECK-LABEL: @pow_intrinsic_third_approx(
; CHECK-NEXT:    [[POW:%.*]] = call afn double @llvm.pow.f64(double [[X:%.*]], double 0x3FD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call afn double @llvm.pow.f64(double %x, double 0x3fd5555555555555)
  ret double %pow
}

define float @powf_intrinsic_third_approx(float %x) {
; CHECK-LABEL: @powf_intrinsic_third_approx(
; CHECK-NEXT:    [[POW:%.*]] = call afn float @llvm.pow.f32(float [[X:%.*]], float 0x3FD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call afn float @llvm.pow.f32(float %x, float 0x3fd5555560000000)
  ret float %pow
}

define double @pow_libcall_third_fast(double %x) {
; CHECK-LABEL: @pow_libcall_third_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast double @pow(double [[X:%.*]], double 0x3FD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call fast double @pow(double %x, double 0x3fd5555555555555)
  ret double %pow
}

define float @powf_libcall_third_fast(float %x) {
; CHECK-LABEL: @powf_libcall_third_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast float @powf(float [[X:%.*]], float 0x3FD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call fast float @powf(float %x, float 0x3fd5555560000000)
  ret float %pow
}

define double @pow_intrinsic_negthird_fast(double %x) {
; CHECK-LABEL: @pow_intrinsic_negthird_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast double @llvm.pow.f64(double [[X:%.*]], double 0xBFD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call fast double @llvm.pow.f64(double %x, double 0xbfd5555555555555)
  ret double %pow
}

define float @powf_intrinsic_negthird_fast(float %x) {
; CHECK-LABEL: @powf_intrinsic_negthird_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast float @llvm.pow.f32(float [[X:%.*]], float 0xBFD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call fast float @llvm.pow.f32(float %x, float 0xbfd5555560000000)
  ret float %pow
}

define double @pow_intrinsic_negthird_approx(double %x) {
; CHECK-LABEL: @pow_intrinsic_negthird_approx(
; CHECK-NEXT:    [[POW:%.*]] = call afn double @llvm.pow.f64(double [[X:%.*]], double 0xBFD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call afn double @llvm.pow.f64(double %x, double 0xbfd5555555555555)
  ret double %pow
}

define float @powf_intrinsic_negthird_approx(float %x) {
; CHECK-LABEL: @powf_intrinsic_negthird_approx(
; CHECK-NEXT:    [[POW:%.*]] = call afn float @llvm.pow.f32(float [[X:%.*]], float 0xBFD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call afn float @llvm.pow.f32(float %x, float 0xbfd5555560000000)
  ret float %pow
}

define double @pow_libcall_negthird_fast(double %x) {
; CHECK-LABEL: @pow_libcall_negthird_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast double @pow(double [[X:%.*]], double 0xBFD5555555555555)
; CHECK-NEXT:    ret double [[POW]]
;
  %pow = call fast double @pow(double %x, double 0xbfd5555555555555)
  ret double %pow
}

define float @powf_libcall_negthird_fast(float %x) {
; CHECK-LABEL: @powf_libcall_negthird_fast(
; CHECK-NEXT:    [[POW:%.*]] = call fast float @powf(float [[X:%.*]], float 0xBFD5555560000000)
; CHECK-NEXT:    ret float [[POW]]
;
  %pow = call fast float @powf(float %x, float 0xbfd5555560000000)
  ret float %pow
}

declare double @llvm.pow.f64(double, double) #0
declare float @llvm.pow.f32(float, float) #0
declare double @pow(double, double)
declare float @powf(float, float)

attributes #0 = { nounwind readnone speculatable }
