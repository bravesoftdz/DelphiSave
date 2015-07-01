object Form1: TForm1
  Left = 262
  Top = 205
  Width = 479
  Height = 285
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SDQuery1: TSDQuery
    SQL.Strings = (
      'SELECT   /*+ QCO7 QCO8 QCO8i QCODBA */'
      
        '         DECODE (a.SID, NULL, 2, 1) sort_order, TO_CHAR (a.SID) ' +
        'SID,'
      '         TO_CHAR (c.serial#) "Serial#", b.job, b.failures,'
      
        '         TO_CHAR (a.this_date, '#39'MM/DD/YYYY hh24:mi:ss'#39') start_ti' +
        'me,'
      
        '         TO_CHAR (b.next_date, '#39'MM/DD/YYYY hh24:mi:ss'#39') next_tim' +
        'e,'
      
        '         TO_CHAR (b.last_date, '#39'MM/DD/YYYY hh24:mi:ss'#39') last_dat' +
        'e,'
      '         (b.log_user) logon_user, (b.priv_user) privilege_user,'
      '         (b.schema_user) schema_user,'
      '         TO_NUMBER (TRUNC (DECODE (a.SID,'
      
        '                                   NULL, (SYSDATE - next_date) *' +
        ' (60 * 24),'
      '                                   b.total_time / 60'
      '                                  )'
      '                          )'
      '                   ) minutes,'
      '         b.INTERVAL, b.what, DECODE (a.SID,'
      '                                     NULL, '#39'Pending'#39','
      '                                     '#39'Running'#39
      '                                    ) status,'
      '         TO_CHAR (TRUNC (DECODE (a.SID,'
      
        '                                 NULL, (SYSDATE - next_date) * (' +
        '60 * 24),'
      '                                 NULL'
      '                                )'
      '                        )'
      '                 ) min_waited,'
      '         broken'
      
        '    FROM SYS.dba_jobs_running a, SYS.dba_jobs b, SYS.v_$session ' +
        'c'
      
        '   WHERE a.job(+) = b.job AND c.SID(+) = a.SID AND b.next_date <' +
        ' SYSDATE'
      'UNION ALL'
      
        'SELECT   DECODE (broken, '#39'Y'#39', 4, 3) sort_order, NULL, NULL, b.jo' +
        'b, b.failures,'
      
        '         NULL, TO_CHAR (b.next_date, '#39'MM/DD/YYYY hh24:mi:ss'#39') ne' +
        'xt_time,'
      
        '         TO_CHAR (b.last_date, '#39'MM/DD/YYYY hh24:mi:ss'#39') last_dat' +
        'e,'
      
        '         (b.log_user), (b.priv_user), (b.schema_user), 0, b.INTE' +
        'RVAL, b.what,'
      
        '         DECODE (broken, '#39'Y'#39', '#39'Broken'#39', '#39'Scheduled'#39') status, NUL' +
        'L, broken'
      '    FROM SYS.dba_jobs b'
      '   WHERE b.next_date >= SYSDATE'
      'ORDER BY sort_order ASC, next_time ASC')
    Left = 232
    Top = 104
  end
end
