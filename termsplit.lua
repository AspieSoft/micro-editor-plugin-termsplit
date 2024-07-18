local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")

function init()
  config.MakeCommand("git-commit", gitCommit, config.NoComplete)


  config.MakeCommand("tsplit", termTab, config.NoComplete)
  config.TryBindKey("Alt-p", "command:tsplit", false)

  config.MakeCommand("ideinit", ideInit, config.NoComplete)
  config.TryBindKey("Alt-i", "command:ideinit", false)


  config.RegisterGlobalOption("ide", "ide", false)

  if config.GetGlobalOption("ide") then
    ideInit(micro.CurPane())
  end
end

function gitCommit(bp, args)
  
end

function termTab(bp)
  bp:HSplitAction()

  local tab = bp:Tab()
  local pane = tab:CurPane()
  -- local id = pane:ID()
  -- local node = tab:GetPane(id)

  -- pane:ResizePane(node.Y + 7)
  bp:ResizePane(30)

  pane:HandleCommand("term")

  openTerm = true
end

function ideInit(bp)
  local tab = bp:Tab()
  local pane = tab:CurPane()

  pane:HandleCommand("tree")
  pane:SetActive(true)
  termTab(pane)
  tab:SetActive(0)
  pane:SetActive(true)
end
