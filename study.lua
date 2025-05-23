require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "study_aly"
import "ou"
import "bit/donghua"
import "bit/pm"

activity.setTheme(R.Theme_Dark_Blue)
activity.setContentView(loadlayout(study_aly))
activity.setTitle("分数查看")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

卡片.startAnimation(平移动画_下)
counts.startAnimation(平移动画_下)
标题.startAnimation(平移动画_下)
内容.startAnimation(平移动画_下)
总分.startAnimation(平移动画_下)

总分数 = 0
data1 = {}
adp1 = LuaAdapter(activity,data1,ou)
count = 0
--设置适配器
counts.Adapter = adp1
function main(姓名,student,记分册)
  标题.setText(姓名)
  类型 = student:match("【"..记分册.."】(.-)【/"..记分册.."】")
  while true do
    count = count + 1
    if 类型:match("【记录"..count.."】(.-)【/记录"..count.."】") == nil then
      break
     else
      文 = 类型:match("【记录"..count.."】(.-)【/记录"..count.."】")
      标题 = 文:match("【标题】(.-)【/标题】")
      分数 = 文:match("【分数】(.-)【/分数】")
      时间 = 文:match("【时间】(.-)【/时间】")
      记录 = 文:match("【/标题】(.+)")
      总分数 = 总分数 + tonumber(分数)
      table.insert(data1,{tit = 标题,thing = 记录,ct = 分数.."分",tm = "时间:"..时间})
    end
  end
  内容.setText("扣分项/加分项：")
  总分.setText("总分数:"..tostring(总分数))
end