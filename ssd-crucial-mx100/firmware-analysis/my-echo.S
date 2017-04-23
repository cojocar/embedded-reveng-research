.globl _start
_start:
# Copyright 2017 The EmbeddedResearchHacking Authors
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
_start:

wait_for_recv:
# read status reg (r0)
	ldr r0, uart_flag_register
	ldrh r0, [r0]
	and r0, $0x10
	cmp r0, $0x0
	beq wait_for_recv

# read in_port
	ldr r0, in_port
	ldrh r0, [r0]
	add r0, r0, $1

	bl put_char
	b _start

# jump back if value is 0

print_:
	# print status flag
	mov r0, $'S'
	bl put_char

	mov r0, r4
	bl put_val

	# print value
	mov r0, $'V'
	bl put_char

	mov r0, r3
	bl put_val

	b wait_for_recv
#
#	# read in r1
#	ldr r0, out_port
#	ldr r1, [r0]
#b .
#	add r1, r1, $1
#	and r1, r1, $0xff
#
#	# write r1
#	ldr r0, out_port
#	str r1, [r0]
#
#	# wait for character to be sent
#wait_to_send:
# 	ldr r0, uart_flag_register
# 	ldrh r0, [r0]
# 	and r0, $0x20 // or 0x28, check TXFF and BUSY
# 	cmp r0, $0
# 	beq wait_to_send
#
#	b _start

# value in r0
put_val:
	push {r0, r1, r2, lr}

	mov r2, r0
	lsr r0, r2, $24
	bl put_char

	lsr r0, r2, $16
	bl put_char

	lsr r0, r2, $8
	bl put_char

	lsr r0, r2, $0
	bl put_char

	pop {r0, r1, r2, lr}
	bx lr

# character to send in r0
put_char:

	push {r0, r1, r2, lr}
	mov r2, r0

__wait_to_send:
 	ldr r0, uart_flag_register
 	ldrh r0, [r0]
 	and r0, $0x20
 	cmp r0, $0
 	beq __wait_to_send

	ldr r0, out_port
	str r2, [r0]

	pop {r0, r1, r2, lr}
	bx lr

out_port:
	.word 0x1c00a624
in_port:
	.word 0x1c00a620
uart_flag_register:
	.word 0x1c00a62c
value:
	.word 0x0e
	#.word 0x910f0000
