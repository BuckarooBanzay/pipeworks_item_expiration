
local expiration_seconds = 10*60 -- 10 minutes

local function cleanup()
  local now = os.time()
  for _, entity in pairs(pipeworks.luaentity.entities) do
    if not entity.ctime then
      -- set creation time if not already set
      entity.ctime = now
    else
      -- check expiration time
      local delta = now - entity.ctime
      if delta > expiration_seconds then
        -- entity expired, remove
        entity:remove()
      end
    end
  end

  minetest.after(10, cleanup)
end

minetest.after(10, cleanup)
