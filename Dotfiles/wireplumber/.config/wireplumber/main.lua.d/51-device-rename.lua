table.insert(alsa_monitor.rules, {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_0c_00.4.iec958-stereo" },
    },
  },
  apply_properties = {
    ["device.nick"] = "Sonos Ray",
    ["device.product.name"] = "Sonos Ray",
    ["node.description"] = "Sonos Ray",
    ["device.description"] = "Sonos Ray"
  },
})

table.insert(alsa_monitor.rules, {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-Samson_Technologies_Samson_C01U_Pro_Mic-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["device.nick"] = "Samson C01U Pro",
    ["device.product.name"] = "Samson C01U Pro",
    ["device.description"] = "Samson C01U Pro",
    ["node.description"] = "Samson C01U Pro"
  },
  }
)
