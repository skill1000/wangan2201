import "edit"
import "bit/pm"
import "bit/donghua"
import "bit/write"
import "java.io.*"
import "android.graphics.drawable.ColorDrawable"
function password1(room,a,b,c)
  file,err=io.open("sdcard/网安2201Cache/data.log")
  if err==nil then
    content=io.open("sdcard/网安2201Cache/data.log"):read("*a")
    file,err1=io.open("sdcard/网安2201Cache/password.ini")
    if err1==nil then
      if io.open("sdcard/网安2201Cache/password.ini"):read("*a")==content:match("【班级密码】(.-)【/班级密码】") then
        activity.newActivity(room,android.R.anim.fade_in,android.R.anim.fade_out,{a,b,c})
        pm("检测到密钥")
       else
        pm("密钥已更改，请重新验证")
        password=content:match("【班级密码】(.-)【/班级密码】")
        al1=AlertDialog.Builder(this).show()
        al1.setCancelable(true)--禁用返回键
        al1.getWindow().setContentView(loadlayout(edit));
        al1.setCanceledOnTouchOutside(false)--点击阴影部分不会关闭弹窗
        al1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
        --启动动画
        按钮.startAnimation(平移动画_下)
        标题.startAnimation(平移动画_上)
        内容.startAnimation(平移动画_上)
        编辑框架.startAnimation(平移动画_下)
        密码.startAnimation(平移动画_下)
        --事件
        one.onClick=function()
          donghua(one,300)
          编辑框.setText(编辑框.text.."1")
        end
        two.onClick=function()
          donghua(two,300)
          编辑框.setText(编辑框.text.."2")
        end
        three.onClick=function()
          donghua(three,300)
          编辑框.setText(编辑框.text.."3")
        end
        four.onClick=function()
          donghua(four,300)
          编辑框.setText(编辑框.text.."4")
        end
        five.onClick=function()
          donghua(five,300)
          编辑框.setText(编辑框.text.."5")
        end
        six.onClick=function()
          donghua(six,300)
          编辑框.setText(编辑框.text.."6")
        end
        seven.onClick=function()
          donghua(seven,300)
          编辑框.setText(编辑框.text.."7")
        end
        eight.onClick=function()
          donghua(eight,300)
          编辑框.setText(编辑框.text.."8")
        end
        nine.onClick=function()
          donghua(nine,300)
          编辑框.setText(编辑框.text.."9")
        end
        zero.onClick=function()
          donghua(zero,300)
          编辑框.setText(编辑框.text.."0")
        end
        back.onClick=function()
          donghua(back,300)
          编辑框.setText(string.sub(编辑框.text,0,#编辑框.text-1))
        end
        按钮1.onClick=function()
          donghua(按钮1,300)
          task(300,function()
            al1.dismiss()
          end)
        end
        按钮2.onClick=function()
          donghua(按钮2,300)
          task(300,function()
            if password==编辑框.text then
              --跳转窗口(有动画)
              activity.newActivity(room,android.R.anim.fade_in,android.R.anim.fade_out,{a,b,c})
              al1.dismiss()
              write("sdcard/网安2201Cache/password.ini",编辑框.text)
              pm("已记住密码，下次免密进入")
             else
              编辑框.error="密码错误"
              编辑框.setText("")
            end
          end)
        end
      end
     else
      password=content:match("【班级密码】(.-)【/班级密码】")
      al1=AlertDialog.Builder(this).show()
      al1.setCancelable(true)--禁用返回键
      al1.getWindow().setContentView(loadlayout(edit));
      al1.setCanceledOnTouchOutside(false)--点击阴影部分不会关闭弹窗
      al1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
      --启动动画
      按钮.startAnimation(平移动画_下)
      标题.startAnimation(平移动画_上)
      内容.startAnimation(平移动画_上)
      编辑框架.startAnimation(平移动画_下)
      密码.startAnimation(平移动画_下)
      --事件
      one.onClick=function()
        donghua(one,300)
        编辑框.setText(编辑框.text.."1")
      end
      two.onClick=function()
        donghua(two,300)
        编辑框.setText(编辑框.text.."2")
      end
      three.onClick=function()
        donghua(three,300)
        编辑框.setText(编辑框.text.."3")
      end
      four.onClick=function()
        donghua(four,300)
        编辑框.setText(编辑框.text.."4")
      end
      five.onClick=function()
        donghua(five,300)
        编辑框.setText(编辑框.text.."5")
      end
      six.onClick=function()
        donghua(six,300)
        编辑框.setText(编辑框.text.."6")
      end
      seven.onClick=function()
        donghua(seven,300)
        编辑框.setText(编辑框.text.."7")
      end
      eight.onClick=function()
        donghua(eight,300)
        编辑框.setText(编辑框.text.."8")
      end
      nine.onClick=function()
        donghua(nine,300)
        编辑框.setText(编辑框.text.."9")
      end
      zero.onClick=function()
        donghua(zero,300)
        编辑框.setText(编辑框.text.."0")
      end
      back.onClick=function()
        donghua(back,300)
        编辑框.setText(string.sub(编辑框.text,0,#编辑框.text-1))
      end
      按钮1.onClick=function()
        donghua(按钮1,300)
        task(300,function()
          al1.dismiss()
        end)
      end
      按钮2.onClick=function()
        donghua(按钮2,300)
        task(300,function()
          if password==编辑框.text then
            pm("已记住密码，下次免密进入")
            --跳转窗口(有动画)
            activity.newActivity(room,android.R.anim.fade_in,android.R.anim.fade_out,{a,b,c})
            al1.dismiss()
            write("sdcard/网安2201Cache/password.ini",编辑框.text)
           else
            编辑框.error="密码错误"
            编辑框.setText("")
          end
        end)
      end
    end
   else
    pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
  end
end