require 'bit'

math.round = (num, idp) ->
  mult = 10 ^ (idp or 0)
  return math.floor(num * mult + 0.5) / mult

math.clamp = (num, min, max) ->
  if type(num) == 'table'
    for k,v in pairs(num)
      num[k] = math.max(math.min(v, max), min) 
  else
    num = math.max(math.min(num, max), min)

  return num

math.pad2 = (i) ->
  math.floor((i + 1) / 2) * 2

math.pad4 = (i) -> 
  return bit.band(bit.band(i,0xFF) + 1 + 3, bit.bnot(0x03)) - 1

math.toUInt16 = (b1, b2) -> 
   return bit.bor(bit.lshift(b1, 8), b2)
  
math.toInt16 = (b1, b2) ->
  val = math.toUInt16(b1, b2)
  if bit.bit(val) >= 0x8000 then 
    bit.bit(val) - 0x10000 
  else val