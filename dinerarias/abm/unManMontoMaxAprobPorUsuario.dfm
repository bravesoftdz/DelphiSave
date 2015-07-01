inherited frmManMontoMaxAprobPorUsuario: TfrmManMontoMaxAprobPorUsuario
  Left = 454
  Top = 243
  Caption = 
    'Mantenimiento de Monto m'#225'ximo de aprobaci'#243'n de liquidaciones por' +
    ' usuario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Color = clWhite
    Columns = <
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usuario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOLIQ'
        Title.Caption = 'Tipo Liquidaci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MONTOMAX'
        Title.Alignment = taCenter
        Title.Caption = 'Monto M'#225'ximo'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 132
    Width = 429
    Height = 137
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 101
      Width = 421
    end
    object Label1: TLabel [1]
      Left = 13
      Top = 20
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object Label2: TLabel [2]
      Left = 13
      Top = 48
      Width = 81
      Height = 13
      Caption = 'Tipo Liquidaci'#243'n:'
    end
    object Label3: TLabel [3]
      Left = 14
      Top = 77
      Width = 72
      Height = 13
      Caption = 'Monto M'#225'ximo:'
    end
    inherited btnAceptar: TButton
      Left = 271
      Top = 107
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 107
      TabOrder = 5
    end
    inline fraUsuario: TfraUsuario
      Left = 104
      Top = 13
      Width = 314
      Height = 21
      TabOrder = 0
      TabStop = True
      inherited cmbDescripcion: TArtComboBox
        Width = 230
      end
    end
    object pnlTipoLiquidacion: TPanel
      Left = 104
      Top = 39
      Width = 158
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      TabStop = True
      object rbILT: TRadioButton
        Left = 87
        Top = 5
        Width = 46
        Height = 17
        Caption = 'ILT'
        TabOrder = 1
        TabStop = True
        OnClick = rbILTClick
      end
      object rbILP: TRadioButton
        Left = 9
        Top = 5
        Width = 46
        Height = 17
        Caption = 'ILP'
        TabOrder = 0
        TabStop = True
        OnClick = rbILPClick
      end
    end
    object edMontoMaximo: TCurrencyEdit
      Left = 268
      Top = 73
      Width = 99
      Height = 20
      AutoSize = False
      Color = clWhite
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 3
    end
    object pnlLimite: TPanel
      Left = 104
      Top = 69
      Width = 158
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      TabStop = True
      object rbSinLimite: TRadioButton
        Left = 87
        Top = 5
        Width = 64
        Height = 17
        Caption = 'Sin l'#237'mite'
        TabOrder = 1
        TabStop = True
        OnClick = rbSinLimiteClick
      end
      object rbConLimite: TRadioButton
        Left = 9
        Top = 5
        Width = 71
        Height = 17
        Caption = 'Con l'#237'mite'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbConLimiteClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT mu_id, se_nombre usuario, decode(mu_montomax, 0, '#39'Sin l'#237'm' +
        'ite'#39', mu_montomax) montomax, mu_montomax,'
      
        '       decode(mu_tipoliq,'#39'I'#39', '#39'ILP'#39', '#39'ILT'#39') TipoLiq, mu_fechabaj' +
        'a, mu_usuario, mu_tipoliq'
      '  FROM sin.smu_montomaxaprobporusuario, art.use_usuarios'
      ' WHERE mu_usuario = se_usuario'
      '   AND mu_fechabaja is null')
  end
end
