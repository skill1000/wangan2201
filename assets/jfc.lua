require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "jfc_aly"
import "item2"
import "bit/donghua"
import "bit/pm"
import "bit/write"
import "java.io.*"

activity.setTheme(R.Theme_Blue)
activity.setContentView(loadlayout(jfc_aly))
activity.setTitle("记分册")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

data = {}
名字 = {}

--创建适配器
adp=LuaAdapter(activity,data,item2)
--设置适配器
list.Adapter=adp

file,err=io.open("sdcard/网安2201Cache/data.log")
if err==nil then
  uio=io.open("sdcard/网安2201Cache/data.log"):read("*a")
  write("sdcard/网安2201Cache/name.log",uio:match("【同学】(.-)【/同学】"))
  for c in io.lines("sdcard/网安2201Cache/name.log") do
    table.insert(data,{image=c:match("|(.+)"),name=c:match("(.+)|")})
    table.insert(名字,c:match("(.+)|"))
  end
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

list.startAnimation(平移动画_下)

list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent, v, pos,id)
    grade = uio:match('【年级】(.-)【/年级】')
    单选列表={}
    ctd = 0
    for word in string.gmatch(grade, "%C+") do
      if ctd >= 1 then
        table.insert(单选列表,string.sub(word,3,#word))
       else
        ctd = ctd + 1
        table.insert(单选列表,word)
      end
    end
    单选=AlertDialog.Builder(this)
    .setTitle("请选择查看的时期：")
    .setSingleChoiceItems(单选列表,-1,{onClick=function(v,p)
        grade = tostring(单选列表[p+1])
        content=uio:match("【"..grade.."】(.-)【/"..grade.."】")
        starttext,endtext = string.find(content,名字[id])
        if starttext then
          dlo.dismiss()
          tio = uio:match("【"..grade.."】(.-)【/"..grade.."】")
          student=tio:match("【"..名字[id].."】(.-)【/"..名字[id].."】")
          单选列表1={}
          count = 0
          while true do
            count = count + 1
            result = tio:match("【记分册"..count.."】(.-)【/记分册"..count.."】")
            if result == nil then
              break
             else
              table.insert(单选列表1,result)
            end
          end
          local 单选对话框=AlertDialog.Builder(this)
          .setTitle("请选择你要查看的记分册")
          .setSingleChoiceItems(单选列表1,-1,{onClick=function(v,p)
              dialog.dismiss()
              activity.newActivity("study",android.R.anim.fade_in,android.R.anim.fade_out,{名字[id],student,单选列表1[p+1]})
            end})
          dialog=单选对话框.show()
         else
          pm("没有记录~qwq")
        end
      end})
    dlo = 单选.show()
  end
})
