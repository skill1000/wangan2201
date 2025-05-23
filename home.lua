--导入系统支持库
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
--导入自写提示支持库
import "bit/pm"
import "bit/ttf"
import "bit/donghua"
import "bit/write"
import "bit/password"
--导入网址访问支持库
import "android.content.Intent"
import "android.net.Uri"
--导入布局文件
import "layout_w"
import "layout_h"
import "item"
import "info2"
import "info"
import "ver"

--创建page控件页数切换变量
mode=0
--创建项目数组
data={}

--设置主样式
activity.setTheme(R.Theme_Cyan)
--设置软件标题
activity.setTitle("网安2201")
--设置布局
if activity.getWidth() > activity.getHeight() then
  activity.setContentView(loadlayout(layout_w))
 else
  activity.setContentView(loadlayout(layout_h))
end

--圆形旋转样式
dialog5 = ProgressDialog(this)
dialog5.setProgressStyle(ProgressDialog.STYLE_SPINNER)
dialog5.setTitle("读取云端数据中...")
--设置进度的形式为圆形转动的进度条
dialog5.setMessage("正在获取云端数据库数据，请稍后...")
dialog5.setCancelable(false)--设置是否可以通过点击Back键取消
dialog5.setCanceledOnTouchOutside(false)--设置在点击Dialog外是否取消Dialog进度条
dialog5.setButton(ProgressDialog.BUTTON_NEGATIVE,"隐藏对话框",function(dialog, which)
  if which == ProgressDialog.BUTTON_NEGATIVE then
    pm("已隐藏对话框")
    dialog5.dismiss()-- 关闭对话框
  end
end)
--取消对话框监听事件
dialog5.show()

--访问数据库
Http.get("https://skill1000.github.io",nil,nil,nil,function(code,content)
  --判断是否访问成功
  if code==200 then
    --把数据库的内容以缓存存入本地
    write("sdcard/网安2201Cache/data.log",content)
    --获取数据库信息
    版本=content:match("【班级版本】(.-)【/班级版本】")
    更新=content:match("【班级更新】(.-)【/班级更新】")
    链接=content:match("【班级链接】(.-)【/班级链接】")
    公告=content:match("【班级公告】(.-)【/班级公告】")
    增量=content:match("【班级增量更新】")
    --检测是否有新版本
    if tonumber(版本)>ver then
      local al1=AlertDialog.Builder(this)
      .setTitle("✨发现新版本✨")
      .setMessage("发现新版本"..ver..">>>"..版本.."\n".."更新内容："..更新)
      .setPositiveButton("立刻更新",{onClick=function(v)
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(链接))
          activity.startActivity(viewIntent)
        end})
      .setNegativeButton("暂不更新",nil)
      .show()
      al1.setCancelable(true)--禁用返回键
      al1.setCanceledOnTouchOutside(false)--点击阴影部分不会关闭弹窗
      al1.getWindow().setBackgroundDrawable(ColorDrawable(0xFFFFFFFF))
     else
      --最新版本弹出提示信息
      pm("已是最新版本")
      dialog5.dismiss()
    end
    local al=AlertDialog.Builder(this).show()
    .setCancelable(true)--禁用返回键
    al.getWindow().setContentView(loadlayout(info));
    al.setCanceledOnTouchOutside(false)--点击阴影部分不会关闭弹窗
    al.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    内容.setText(公告)
    按钮.setText("我知道了")
    标题.setText("📢公告📢")
    --启动动画
    按钮.startAnimation(平移动画_下)
    标题.startAnimation(平移动画_上)
    内容.startAnimation(平移动画_下)
    --事件
    按钮.onClick=function()
      donghua(按钮,300)
      task(300,function()
        al.dismiss()
      end)
    end
   else
    --访问数据库失败提示并显示报错代码
    pm("无法连接数据库"..code.."\n请检查网络设置和代理")
  end
end)

--按两次返回键退出软件
--设置变量
co=0
--按键检测
function onKeyDown(code,event)
  --判断返回键是否被按下
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    --判断在一定时间内是否连续按两次返回键
    if co+2 > tonumber(os.time()) then
      --退出程序
      activity.finish()
     else
      --弹出提示
      pm("再按一次返回键退出")
      co=tonumber(os.time())
    end
    return true
  end
end

--设置page控件页面
page.showPage(mode)

--设置自动切换page页面
ti=Ticker()
--设置切换间隔（毫秒）
ti.Period=3000
--设置计时器事件
ti.onTick=function()
  if mode<3 then
    mode=mode+1
    page.showPage(mode)
   else
    mode=0
    page.showPage(mode)
  end
end
--开启计时器时间
ti.start()

--设置字体样式
ttf(简介标题,"ttf/soft.ttf")
ttf(简介介绍,"ttf/soft.ttf")
ttf(公益标题,"ttf/soft.ttf")
ttf(公益介绍,"ttf/soft.ttf")
ttf(同学标题,"ttf/soft.ttf")
ttf(同学介绍,"ttf/soft.ttf")
ttf(特色标题,"ttf/soft.ttf")
ttf(特色介绍,"ttf/soft.ttf")
ttf(特长标题,"ttf/soft.ttf")
ttf(特长介绍,"ttf/soft.ttf")
ttf(关于标题,"ttf/soft.ttf")
ttf(关于介绍,"ttf/soft.ttf")
ttf(记分册标题,"ttf/soft.ttf")
ttf(记分册介绍,"ttf/soft.ttf")
ttf(班级重要事件标题,"ttf/soft.ttf")
ttf(班级重要事件介绍,"ttf/soft.ttf")
ttf(班干部名单标题,"ttf/soft.ttf")
ttf(班干部名单介绍,"ttf/soft.ttf")
ttf(排行榜标题,"ttf/soft.ttf")
ttf(排行榜介绍,"ttf/soft.ttf")

--设置动画
home.startAnimation(平移动画_上)

c_js.startAnimation(平移动画_左)
c_tx.startAnimation(平移动画_左)
c_tc.startAnimation(平移动画_左)
c_jfc.startAnimation(平移动画_左)
c_bgbmd.startAnimation(平移动画_左)

c_gy.startAnimation(平移动画_右)
c_ts.startAnimation(平移动画_右)
c_zz.startAnimation(平移动画_右)
c_bjzysj.startAnimation(平移动画_右)
c_phb.startAnimation(平移动画_右)

--简介卡片被点击事件
function c_js.onClick()
  --播放动画
  donghua(c_js,300)
  --跳转窗口(有动画)
  activity.newActivity("js",android.R.anim.fade_in,android.R.anim.fade_out)
end

--公益卡片被点击事件
function c_gy.onClick()
  --播放动画
  donghua(c_gy,300)
  --跳转窗口(有动画)
  activity.newActivity("gy",android.R.anim.fade_in,android.R.anim.fade_out)
end

--同学卡片被点击事件
function c_tx.onClick()
  --播放动画
  donghua(c_tx,300)
  --跳转窗口(有动画)
  activity.newActivity("tx",android.R.anim.fade_in,android.R.anim.fade_out)
end

--海报卡片被点击事件
function c_ts.onClick()
  --播放动画
  donghua(c_ts,300)
  --跳转窗口(有动画)
  activity.newActivity("ts",android.R.anim.fade_in,android.R.anim.fade_out)
end

--特长卡片被点击事件
function c_tc.onClick()
  --播放动画
  donghua(c_tc,300)
  --跳转窗口(有动画)
  activity.newActivity("tc",android.R.anim.fade_in,android.R.anim.fade_out)
end

--关于卡片被点击事件
function c_zz.onClick()
  --播放动画
  donghua(c_zz,300)
  --跳转窗口(有动画)
  activity.newActivity("zz",android.R.anim.fade_in,android.R.anim.fade_out)
end

--记分册卡片被点击事件
function c_jfc.onClick()
  --播放动画
  donghua(c_jfc,300)
  password("jfc")
end

--班级重要事件卡片被点击事件
function c_bjzysj.onClick()
  --播放动画
  donghua(c_bjzysj,300)
  password("bjzysj")
end

--班干部名单卡片被点击事件
function c_bgbmd.onClick()
  --播放动画
  donghua(c_bgbmd,300)
  file,err=io.open("sdcard/网安2201Cache/data.log")
  if err==nil then
    content=io.open("sdcard/网安2201Cache/data.log"):read("*a")
   else
    pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
  end
  md=content:match("【班干部名单】(.-)【/班干部名单】")
  --跳转窗口(有动画)
  activity.newActivity("bgbmd",android.R.anim.fade_in,android.R.anim.fade_out,{md})
end

--排行榜卡片被点击事件
function c_phb.onClick()
  --播放动画
  donghua(c_phb,300)
  file,err=io.open("sdcard/网安2201Cache/data.log")
  if err==nil then
    content=io.open("sdcard/网安2201Cache/data.log"):read("*a")
   else
    pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
  end
  grade = content:match('【年级】(.-)【/年级】')
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
      uio=content:match("【"..grade.."】(.-)【/"..grade.."】")
      dlo.dismiss()
      单选列表1={}
      count = 0
      while true do
        count = count + 1
        result = uio:match("【记分册"..count.."】(.-)【/记分册"..count.."】")
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
          --跳转窗口(有动画)
          activity.newActivity("phb",android.R.anim.fade_in,android.R.anim.fade_out)
          write("sdcard/网安2201Cache/phb.log","【年级】"..grade.."【/年级】【记分册】"..单选列表1[p+1].."【/记分册】")
        end})
      dialog=单选对话框.show()
    end})
  dlo = 单选.show()
end

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end
