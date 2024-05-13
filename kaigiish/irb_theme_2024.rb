Reline::LineEditor.prepend Module.new {
  eval <<~RUBY
    def colorize_completion_dialog

         #{(%W(d=@d          ialogs[0];          (c=d&.cont                ents
       )&&(y=d.scroll      _top      ;f=R      eline::Face[:c            omplet
      ion_di    alog];   s=T            ime   .now.t    o_f;c[         0..]=c.i
      nsta        nce_  ev   al{@o||=du   p}  .map        {|t|       e=t.  inde
                 x(f[:  en hanced]);x=0;l =t             .gsub     (/#e    #[[^
              m]*m/,'   ')   .chars.map   {"          #e[48;5    ;${e      ==0?
           '210;1'      :1     45+[(y     +z       =((4*s+      x+=1)/2).floor)%
        2+z%5/3          <1?     0:     43,     6,41][(         y%7-3)**2/4]};38
      ;5;237m"+_1}*'';     y+=1      ;t[1     ..][f[:scrollbar             ]]&&
      l[-1,0]="#e[38;5       ;203m";l})       )*'').tr'$#',?#+             ?\\}

    end
  RUBY

  def update_dialogs(...)
    super(...)
    colorize_completion_dialog
  end

  def rerender
    (@mutex ||= Mutex.new).synchronize { super }
  end
}

Thread.new do
  Reline.line_editor.instance_eval do
    loop do
      sleep 0.1
      colorize_completion_dialog && rerender
    end
  end
end
