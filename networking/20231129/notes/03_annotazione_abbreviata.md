/24 /64 /128

64 4pc network

in a subnet mask with /24, 24 bits are used for the network address and 8 for
the host address

this means there are 24 number 1s and 8 number 0s

11111111.11111111.11111111.00000000

the more 1 you add, the less hosts you can have

every 1 added convert byte into binary, / is the number of 1s (whole subnet)

- 10000000 = 128 = /25 = 126 host
- 11000000 = 192 = /26 = 62 host
- 11100000 = 224 = /27 = 30 host
- 11110000 = 240 = /28 = 14 host
- 11111000 = 248 = /29 = 6 host
- 11111100 = 252 = /30 = 4 host
- 11111110 = 254 = /31 = 2 host
- 11111111 = 255 = /32 = 1 host
