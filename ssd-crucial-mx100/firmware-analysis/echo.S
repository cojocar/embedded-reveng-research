.globl _start
#define OFFSET 0x00011fb4
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
#define OFFSET 0x00011fb4

_start:

again:
	nop
wait_for_recv:
	ldr r0, uart_flag_register
	ldr r0, [r0]
	and r0, $0x10 // RXFE -- rx fifo empty
	cmp r0, $0
	bne wait_for_recv

	ldr r0, out_port

	# read in r1
	ldr r1, [r0]
	add r1, r1, $1
	# write r1 back
	str r1, [r0]

wait_to_send:
	ldr r0, uart_flag_register
	ldr r0, [r0]
	and r0, $0x20 // TXFF -- tx fifo full, or 0x28, check TXFF and BUSY
	cmp r0, $0
	bne wait_to_send

b again

out_port:
	.word 0xfffb8000
uart_flag_register:
	.word 0xfffb8018
