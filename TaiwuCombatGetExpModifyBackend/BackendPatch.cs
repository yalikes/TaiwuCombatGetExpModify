using TaiwuModdingLib.Core.Plugin;
using GameData.Utilities;
using HarmonyLib;
using GameData.Domains.Combat;
using GameData.Domains;
using Microsoft.VisualBasic;
using System.Runtime.CompilerServices;
using Config;
using System.Reflection;

namespace CombatGetExpModify
{
    [PluginConfig("CombatGetExpModify", "algebnaly", "0.2.0")]
    public class BackendPatch: TaiwuRemakePlugin
    {
        public static int scale_factor_value = 30;
        public static int spiritual_scale_factor_value = 30;
        public static string modIdStr;
        Harmony harmony;
        public override void Dispose()
        {
            if(harmony != null)
            {
                harmony.UnpatchSelf();
            }
        }

        public override void Initialize()
        {
            harmony = new Harmony("com.paohui.mod");
            harmony.PatchAll();
            modIdStr = this.ModIdStr;
        }
    }

    [HarmonyPatch(typeof(CombatDomain))]
    [HarmonyPatch(nameof(CombatDomain.EndCombat))]
    public class PatchGalbalConfigBackend
    {
        public static bool is_saved = false;
        public static short[] orginalCombatGetExpBase = null;
        public static void Prefix()
        {
            if (!is_saved)
            {
                orginalCombatGetExpBase = (short[])GlobalConfig.Instance.CombatGetExpBase.Clone();
                is_saved = true;
            }
            var is_success = DomainManager.Mod.GetSetting(BackendPatch.modIdStr, "combat_get_exp_scale_factor", ref BackendPatch.scale_factor_value);
            if (!is_success)
            {
                BackendPatch.scale_factor_value= 30;
                AdaptableLog.Info("战斗历练地区恩义获取修改: 没有能够读取设置" + BackendPatch.scale_factor_value);
            }
            double scale_factor = BackendPatch.scale_factor_value/10.0;
            for (int i = 0; i < GlobalConfig.Instance.CombatGetExpBase.Length; i++)
            {
                GlobalConfig.Instance.CombatGetExpBase[i]=(short)(orginalCombatGetExpBase[i] * scale_factor);
            }
        }
    }
    [HarmonyPatch(typeof(CombatDomain))]
    [HarmonyPatch(nameof(CombatDomain.CombatSettlement))]
    public class PatchSpiritualAquire
    {
        static short[] org_sprititual_list = null;
        static bool is_saved = false;
        public static void Prefix()
        {
            var random_enemy_count = Config.RandomEnemy.Instance.Count;
            if (!is_saved)//save original spiritual list
            {
                org_sprititual_list = new short[random_enemy_count];
                for (int i = 0; i < random_enemy_count; i++)
                {
                    org_sprititual_list[i] = RandomEnemy.Instance[i].SpiritualDebt;
                }
                is_saved = true;
            }
            var is_success = DomainManager.Mod.GetSetting(BackendPatch.modIdStr, "combat_get_spiritual_scale_factor", ref BackendPatch.spiritual_scale_factor_value);
            if (!is_success) {
                BackendPatch.spiritual_scale_factor_value = 3;
                AdaptableLog.Info("战斗历练地区恩义获取修改: 没有能够读取设置");
            }
            for (int i = 0; i < random_enemy_count; i++)
            {
                if (RandomEnemy.Instance[i] != null)
                {
                    typeof(RandomEnemyItem)
                        .GetField("SpiritualDebt", BindingFlags.Instance | BindingFlags.Public)
                        .SetValue(RandomEnemy.Instance[i], (short)(org_sprititual_list[i] * BackendPatch.spiritual_scale_factor_value));
                }
            }
        }
    }
}
