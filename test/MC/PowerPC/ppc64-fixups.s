
# RUN: llvm-mc -triple powerpc64-unknown-unknown --show-encoding %s | FileCheck %s

# RUN: llvm-mc -triple powerpc64-unknown-unknown -filetype=obj %s | \
# RUN: llvm-readobj -r | FileCheck %s -check-prefix=REL


# FIXME: .TOC.@tocbase

# CHECK: li 3, target@l                  # encoding: [0x38,0x60,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_LO target 0x0
         li 3, target@l

# CHECK: addis 3, 3, target@ha           # encoding: [0x3c,0x63,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_HA target 0x0
         addis 3, 3, target@ha

# CHECK: lis 3, target@ha                # encoding: [0x3c,0x60,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_HA target 0x0
         lis 3, target@ha

# CHECK: addi 4, 3, target@l             # encoding: [0x38,0x83,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_LO target 0x0
         addi 4, 3, target@l

# CHECK: lwz 1, target@l(3)              # encoding: [0x80,0x23,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_LO target 0x0
         lwz 1, target@l(3)

# CHECK: ld 1, target@l(3)               # encoding: [0xe8,0x23,A,0bAAAAAA00]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@l, kind: fixup_ppc_lo16_ds
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_ADDR16_LO_DS target 0x0
         ld 1, target@l(3)

# CHECK: ld 1, target@toc(2)             # encoding: [0xe8,0x22,A,0bAAAAAA00]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@toc, kind: fixup_ppc_lo16_ds
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TOC16_DS target 0x0
         ld 1, target@toc(2)

# CHECK: addis 3, 2, target@toc@ha       # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@toc@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TOC16_HA target 0x0
         addis 3, 2, target@toc@ha

# CHECK: addi 4, 3, target@toc@l         # encoding: [0x38,0x83,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@toc@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TOC16_LO target 0x0
         addi 4, 3, target@toc@l

# CHECK: lwz 1, target@toc@l(3)          # encoding: [0x80,0x23,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@toc@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TOC16_LO target 0x0
         lwz 1, target@toc@l(3)

# CHECK: ld 1, target@toc@l(3)           # encoding: [0xe8,0x23,A,0bAAAAAA00]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@toc@l, kind: fixup_ppc_lo16_ds
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TOC16_LO_DS target 0x0
         ld 1, target@toc@l(3)

# FIXME: @tls


# CHECK: addis 3, 2, target@tprel@ha     # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@tprel@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TPREL16_HA target 0x0
         addis 3, 2, target@tprel@ha

# CHECK: addi 3, 3, target@tprel@l       # encoding: [0x38,0x63,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@tprel@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_TPREL16_LO target 0x0
         addi 3, 3, target@tprel@l

# CHECK: addis 3, 2, target@dtprel@ha    # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@dtprel@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_DTPREL16_HA target 0x0
         addis 3, 2, target@dtprel@ha

# CHECK: addi 3, 3, target@dtprel@l      # encoding: [0x38,0x63,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@dtprel@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_DTPREL16_LO target 0x0
         addi 3, 3, target@dtprel@l


# CHECK: addis 3, 2, target@got@tprel@ha # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tprel@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TPREL16_HA target 0x0
         addis 3, 2, target@got@tprel@ha

# CHECK: ld 1, target@got@tprel@l(3)     # encoding: [0xe8,0x23,A,0bAAAAAA00]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tprel@l, kind: fixup_ppc_lo16_ds
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TPREL16_LO_DS target 0x0
         ld 1, target@got@tprel@l(3)


# CHECK: addis 3, 2, target@got@tlsgd@ha # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tlsgd@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TLSGD16_HA target 0x0
         addis 3, 2, target@got@tlsgd@ha

# CHECK: addi 3, 3, target@got@tlsgd@l   # encoding: [0x38,0x63,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tlsgd@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TLSGD16_LO target 0x0
         addi 3, 3, target@got@tlsgd@l


# CHECK: addis 3, 2, target@got@tlsld@ha # encoding: [0x3c,0x62,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tlsld@ha, kind: fixup_ppc_ha16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TLSLD16_HA target 0x0
         addis 3, 2, target@got@tlsld@ha

# CHECK: addi 3, 3, target@got@tlsld@l   # encoding: [0x38,0x63,A,A]
# CHECK-NEXT:                            #   fixup A - offset: 0, value: target@got@tlsld@l, kind: fixup_ppc_lo16
# CHECK-REL:                             0x{{[0-9,A-F]+}} R_PPC64_GOT_TLSLD16_LO target 0x0
         addi 3, 3, target@got@tlsld@l

