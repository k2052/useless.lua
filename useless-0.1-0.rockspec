package = 'useless'
version = "0.1-0"
source = {
  url = 'git://github.com/bookworm/useless.lua.git',
}
description = {
  summary  = "A simple collection of relatively useless functions.",
  detailed = [[Detail]],
  homepage = 'http://github.com/bookworm/useless.lua',
  license  = 'none',
}
dependencies = {
  'lua ~> 5.1'
}
build = { type = 'builtin',
  modules = {
    useless = 'useless.lua'
  }, 
}