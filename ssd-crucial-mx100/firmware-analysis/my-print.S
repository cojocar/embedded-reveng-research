.globl _start

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
	# this is the the register that will be printed
	mov r1, $'A'

print:

	# write r1
	ldr r0, out_port
	str r1, [r0]

	# wait for character to be sent
wait_to_send:
 	ldr r0, uart_flag_register
 	ldrh r0, [r0]
 	and r0, $0x20 // or 0x28, check TXFF and BUSY
 	cmp r0, $0
 	beq wait_to_send

#over:
	add r1, r1, $1
	and r1, r1, $0xff

	b print

out_port:
	.word 0x1c00a624
uart_flag_register:
	.word 0x1c00a62c
