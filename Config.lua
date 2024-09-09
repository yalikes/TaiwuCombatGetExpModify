return {
	Title = "战斗历练地区恩义获取修改",
	Author = "algebnaly",
	Cover = "Cover.png",
	WorkshopCover = "Cover.png",
	Source = 0,
	GameVersion = "0.0.72.14-test",
	Version = "1.0.2.0",
	FileId = 3172379059,
	Visibility = 0,
	UpdateLogList = {
		[1] = {
			Timestamp = 1709473281,
		},
		[2] = {
			Timestamp = 1709967278,
			LogList = {
				[1] = "修复了因为每次战斗后都倍增历练获取基数导致数值溢出的bug",
			},
		},
		[3] = {
			Timestamp = 1713849496,
		},
		[4] = {
			Timestamp = 1713872931,
			LogList = {
				[1] = "移除mod中不必要的文件",
			},
		},
		[5] = {
			Timestamp = 1725863683,
			LogList = {
				[1] = "添加了修改地区恩义获取倍数功能",
			},
		},
	},
	TagList = {
		[1] = "Modifications",
	},
	BackendPlugins = {
		[1] = "TaiwuCombatGetExpModifyBackend.dll",
	},
	Description = "        简单地增加战斗历练获取基础值\n        原来的历练获取基础值为\n        {\n          15, 30, 60, 90, 135, 180, 240, 315, 390, 480,\n          570, 690, 840, 1020, 1230, 1500, 1830, 2280, 2850\n        };\n        我将其设置为该基础值的倍数, 向下取整。\n        默认为3倍, 可以在mod设置中修改, 注意不要超过11倍否则可能数值溢出倒扣历练值!\n        Github: TaiwuCombatGetExpModify\n        ",
	DefaultSettings = {
		[1] = {
			SettingType = "Slider",
			Key = "combat_get_exp_scale_factor",
			DisplayName = "战斗历练获取倍数设置(单位: 0.1倍)",
			Description = "1个单位表示原获取历练的0.1倍, 默认值20表示获取历练为原来的两倍",
			MinValue = 1,
			MaxValue = 110,
			StepSize = 1,
			DefaultValue = 30,
		},
		[2] = {
			SettingType = "Slider",
			Key = "combat_get_spiritual_scale_factor",
			DisplayName = "战斗地区恩义获取倍数设置(单位1倍)",
			Description = "",
			MinValue = 1,
			MaxValue = 20,
			StepSize = 1,
			DefaultValue = 3,
		},
	},
	ChangeConfig = false,
	HasArchive = false,
	NeedRestartWhenSettingChanged = false,
}
