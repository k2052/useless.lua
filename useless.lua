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
table.contains = function(table, key)
  for _, value in pairs(table) do
    if value == key then
      return true
    end
  end
  return false
end
table.insertM = function(t, ...)
  local maxn = table.maxn(arg)
  for i, v in pairs(arg) do
    if i ~= maxn then
      table.insert(t, v)
    end
  end
end
deepCopy = function(object)
  local lookup_table = { }
  local _copy
  _copy = function(object)
    if type(object) ~= "table" then
      return object
    elseif lookup_table[object] then
      return lookup_table[object]
    end
    local new_table = { }
    lookup_table[object] = new_table
    for index, value in pairs(object) do
      new_table[_copy(index)] = _copy(value)
    end
    return setmetatable(new_table, getmetatable(object))
  end
  return _copy(object)
end
