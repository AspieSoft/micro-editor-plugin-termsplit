local config = import("micro/config")

function init()
  config.MakeCommand("tsplit", termTab, config.NoComplete)
  config.TryBindKey("Alt-p", "command:tsplit", false)
end

function termTab(bp)
  bp:HSplitAction()
  local tab = bp:Tab()
  local pane = tab:CurPane()
  local id = pane:ID()
  local node = tab:GetNode(id)
  pane:ResizePane(node.Y + 7)

  pane:HandleCommand("term")
end
