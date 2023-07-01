rule = {
  matches = {
    {
      { "device.bus-path", "equals", "pci-0000:0a:00.1" },
    },
  },
  apply_properties = {
    ["device.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
