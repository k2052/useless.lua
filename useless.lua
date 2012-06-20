require('bit')
math.round = function(num, idp)
  local mult = 10 ^ (idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
math.clamp = function(num, min, max)
  if type(num) == 'table' then
    for k, v in pairs(num) do
      num[k] = math.max(math.min(v, max), min)
    end
  else
    num = math.max(math.min(num, max), min)
  end
  return num
end
math.pad2 = function(i)
  return math.floor((i + 1) / 2) * 2
end
math.pad4 = function(i)
  return bit.band(bit.band(i, 0xFF) + 1 + 3, bit.bnot(0x03)) - 1
end
math.toUInt16 = function(b1, b2)
  return bit.bor(bit.lshift(b1, 8), b2)
end
math.toInt16 = function(b1, b2)
  local val = math.toUInt16(b1, b2)
  if bit.bit(val) >= 0x8000 then
    return bit.bit(val) - 0x10000
  else
    return val
  end
end
