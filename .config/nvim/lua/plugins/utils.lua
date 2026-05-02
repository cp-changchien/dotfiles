local M = {}

function M.pack_clean()
    local active = {}
    local unused = {}

    for _, p in ipairs(vim.pack.get()) do
        if p.active then active[p.spec.name] = true end
    end

    for _, p in ipairs(vim.pack.get()) do
        if not active[p.spec.name] then
            table.insert(unused, p.spec.name)
        end
    end

    if #unused == 0 then
        print("No unused plugins")
        return
    end

    if vim.fn.confirm("Remove " .. #unused .. " unused plugins?", "&Yes\n&No", 2) == 1 then
        vim.pack.del(unused)
    end
end

return M