return {
    Title = "战斗历练获取修改",
    Author = "在下炮灰",
    Cover = "Cover.png",
    WorkshopCover = "Cover.png",
    Source = 1,
    GameVersion = "0.0.69.65",
    Version = "1.0.0",
    TagList = {
    },
    BackendPlugins = {
      "CombatGetExpModifyBackend.dll"
    },
    Description = [[
        简单地增加战斗历练获取基础值
        原来的历练获取基础值为
        {
          15, 30, 60, 90, 135, 180, 240, 315, 390, 480,
          570, 690, 840, 1020, 1230, 1500, 1830, 2280, 2850
        };
        我将其设置为该基础值的倍数, 向下取整。
        默认为3倍, 可以在mod设置中修改, 注意不要超过11倍否则可能数值溢出倒扣历练值!
        Github: https://github.com/yalikes/TaiwuCombatGetExpModify
        ]],
    DefaultSettings = {
      {
        SettingType = "Slider",
        Key = "combat_get_exp_scale_factor",
        DisplayName = "战斗历练获取倍数设置(单位: 0.1倍)",
        Description = "1个单位表示原获取历练的0.1倍, 默认值20表示获取历练为原来的两倍",
        MinValue = 1,
        MaxValue = 110,
        StepSize = 1,
        DefaultValue = 1
      }
    }
}
