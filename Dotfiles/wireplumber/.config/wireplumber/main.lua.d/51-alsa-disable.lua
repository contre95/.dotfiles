rule = {
  matches = {
    {
      { "device.bus-path", "equals", "pci-0000:0a:00.1" },
      { "device.name", "equals", "lsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.3" },
    },
  },
  apply_properties = {
    ["device.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
