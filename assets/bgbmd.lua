require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "bgbmd_aly"
import "bgb"
import "bit/donghua"
import "bit/write"

activity.setTheme(R.Theme_Blue)
activity.setContentView(loadlayout(bgbmd_aly))
activity.setTitle("班干部名单")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

data={}
名字 = {}
头 = {}
--创建适配器
adp=LuaAdapter(activity,data,bgb)
--设置适配器
list.Adapter=adp

file,err=io.open("sdcard/网安2201Cache/data.log")
if err==nil then
  uio=io.open("sdcard/网安2201Cache/data.log"):read("*a")
  write("sdcard/网安2201Cache/name.log",uio:match("【同学】(.-)【/同学】"))
  for c in io.lines("sdcard/网安2201Cache/name.log") do
    table.insert(头,c:match("|(.+)"))
    table.insert(名字,c:match("(.+)|"))
  end
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

function main(md)
  j = 0
  while true do
    j = j + 1
    if md:match("【名单"..j.."】(.-)【/名单"..j.."】") == nil then
      break
     else
      名=md:match("【名单"..j.."】(.-)【/名单"..j.."】")
      职务=名:match("【职务】(.-)【/职务】")
      号=tonumber(名:match("【学号】(.-)【/学号】"))
      table.insert(data,{image=头[号],name=名字[号],major=职务})
    end
  end
end


list.startAnimation(平移动画_下)
