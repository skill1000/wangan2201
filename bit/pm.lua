function pm(文字)
  ts={
    LinearLayout;
    id="li";
    gravity="center";
    layout_height="fill";
    layout_width="fill";
    orientation="horizontal";
    {
      ImageView;
      layout_marginLeft="5dp";
      layout_width="50dp";
      layout_height="50dp";
      src="icon.png";
    };
    {
      CardView;
      radius="12dp";
      layout_marginLeft="10dp";
      BackgroundColor="0xFF000000";
      layout_height="fill";
      layout_width="fill";
      {
        LinearLayout;
        gravity="center";
        layout_height="fill";
        layout_width="fill";
        orientation="horizontal";
        {
          TextView;
          layout_marginLeft="10dp";
          gravity="center";
          layout_marginLeft="10dp";
          layout_marginRight="10dp";
          layout_marginTop="10dp";
          layout_marginBottom="10dp";
          textColor="0xFFFFFFFF";
          textSize="16dp";
          text=文字;
          id="host";
        };
      };
    };
  };
  布局=loadlayout(ts)
  if #文字/3>=10 then
    local toast=Toast.makeText(activity,文字,Toast.LENGTH_LONG)
    .setView(布局)
    .show()
   else
    local toast=Toast.makeText(activity,文字,Toast.LENGTH_SHORT)
    .setView(布局)
    .show()
  end
  import "bit/ttf"
  ttf(host,"/ttf/soft.ttf")
  import "bit/donghua"
  dh(li)
end

