inherited frmManEventosReca: TfrmManEventosReca
  Left = 328
  Top = 127
  Width = 793
  Height = 578
  Caption = 'Eventos de Recalificaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 785
    object gbEvento: TGroupBox
      Left = 4
      Top = 1
      Width = 777
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Evento'
      TabOrder = 0
      DesignSize = (
        777
        41)
      inline fraEvento: TfraCodigoDescripcion
        Left = 6
        Top = 14
        Width = 765
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 700
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 785
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 781
      end>
    inherited ToolBar: TToolBar
      Width = 768
    end
  end
  inherited Grid: TArtDBGrid
    Width = 785
    Height = 474
    Columns = <
      item
        Expanded = False
        FieldName = 'em_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_descripcion'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_automatico'
        Title.Caption = 'Autom'#225'tico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_codcartadoc'
        Title.Caption = 'Cod. Carta Doc. '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_digitaliza'
        Title.Caption = 'Digitaliza'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_imprimirsrt'
        Title.Caption = 'Imprimir SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_telegrama'
        Title.Caption = 'Telegrama'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_telegramatrab'
        Title.Caption = 'Telegrama Trab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_citacion'
        Title.Caption = 'Citaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_seguimiento'
        Title.Caption = 'Seguimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_reubicacion'
        Title.Caption = 'Reubicaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_parteevolutivo'
        Title.Caption = 'Parte Evol.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_altareca'
        Title.Caption = 'Alta Reca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_citaciondoble'
        Title.Caption = 'Citac. Doble'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_notificacion'
        Title.Caption = 'Notificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_responsable'
        Title.Caption = 'Responsable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_segterreno'
        Title.Caption = 'Seg. Terreno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_derivinterior'
        Title.Caption = 'Deriv. Interior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_eventosrt'
        Title.Caption = 'Evento SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_amerita'
        Title.Caption = 'Amerita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_profesional'
        Title.Caption = 'Profesional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_fechaantalta'
        Title.Caption = 'Fecha Ant. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_recadictamen'
        Title.Caption = 'Reca Dict.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_avsugreca'
        Title.Caption = 'Av. Sug. Reca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_seguimientosin'
        Title.Caption = 'Seguim. Sin'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_seguimientocon'
        Title.Caption = 'Seguim. Con'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_telegrecaprof'
        Title.Caption = 'Teleg. Reca Prof.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_telegrecaprest'
        Title.Caption = 'Teleg. Reca Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_generaautorizacion'
        Title.Caption = 'Genera Aut.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_prestacionaut'
        Title.Caption = 'Prestaci'#243'n Aut.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_prestadoraut'
        Title.Caption = 'Prestador Aut.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_gtrabajoaut'
        Title.Caption = 'G. Trabajo Aut.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_eventoanterior'
        Title.Caption = 'Evento Ant.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_capint'
        Title.Caption = 'Cap. Int.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_eventoauto'
        Title.Caption = 'Evento Auto.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_iniciareca'
        Title.Caption = 'Inicia Reca'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 128
    Width = 673
    Height = 325
    BorderStyle = bsSingle
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 289
      Width = 665
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 46
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 12
      Top = 95
      Width = 76
      Height = 13
      Caption = 'Cod. Carta Doc.'
    end
    object Label7: TLabel [4]
      Left = 408
      Top = 189
      Width = 62
      Height = 13
      Caption = 'Evento Auto.'
    end
    object Bevel1: TBevel [5]
      Left = 24
      Top = 75
      Width = 623
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label8: TLabel [6]
      Left = 162
      Top = 95
      Width = 42
      Height = 13
      Caption = 'Digitaliza'
    end
    object Label9: TLabel [7]
      Left = 199
      Top = 189
      Width = 73
      Height = 13
      Caption = 'Evento Anterior'
    end
    inherited btnAceptar: TButton
      Left = 515
      Top = 295
      TabOrder = 32
    end
    inherited btnCancelar: TButton
      Left = 593
      Top = 295
      TabOrder = 33
    end
    object edCodigo: TEdit
      Left = 76
      Top = 16
      Width = 97
      Height = 21
      Hint = 'C'#243'digo del evento'
      MaxLength = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 42
      Width = 569
      Height = 21
      Hint = 'Descripci'#243'n del evento'
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object chkAutomatico: TCheckBox
      Left = 282
      Top = 92
      Width = 77
      Height = 17
      Hint = 'Indica si el evento se da de alta autom'#225'ticamente'
      Caption = 'Autom'#225'tico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object chkImprimirSRT: TCheckBox
      Left = 379
      Top = 92
      Width = 81
      Height = 17
      Hint = 'Indica si se imprime el informe SRT'
      Caption = 'Imprimir SRT'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object chkTelegrama: TCheckBox
      Left = 477
      Top = 92
      Width = 73
      Height = 17
      Hint = 'Indica si se envia telegrama'
      Caption = 'Telegrama'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object edCodCartaDoc: TEdit
      Left = 92
      Top = 90
      Width = 61
      Height = 21
      Hint = 'C'#243'digo de carta documento (si corresponde)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object chkTelegramaTrab: TCheckBox
      Left = 561
      Top = 92
      Width = 97
      Height = 17
      Hint = 
        'Indica si se envia telegrama al trabajador cuando se da de baja ' +
        'el evento'
      Caption = 'Telegrama Trab.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object chkCitacion: TCheckBox
      Left = 12
      Top = 116
      Width = 61
      Height = 17
      Hint = 'Indica si el evento es de citaci'#243'n'
      Caption = 'Citaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object chkSeguimiento: TCheckBox
      Left = 106
      Top = 116
      Width = 81
      Height = 17
      Hint = 'Indica si el evento es de seguimiento'
      Caption = 'Seguimiento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object chkReubicacion: TCheckBox
      Left = 195
      Top = 116
      Width = 81
      Height = 17
      Hint = ': Indica si el evento es de reubicaci'#243'n'
      Caption = 'Reubicaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object chkParteEvolutivo: TCheckBox
      Left = 282
      Top = 116
      Width = 92
      Height = 17
      Hint = 'Indica si se inserta parte evolutivo'
      Caption = 'Parte Evolutivo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object chkAltaReca: TCheckBox
      Left = 379
      Top = 116
      Width = 65
      Height = 17
      Hint = 'Indica si es un evento de alta'
      Caption = 'Alta Reca'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object chkCitacDoble: TCheckBox
      Left = 477
      Top = 116
      Width = 81
      Height = 17
      Hint = 'Indica si es un evento de citacion doble'
      Caption = 'Citac. D'#243'ble'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object chkNotificacion: TCheckBox
      Left = 561
      Top = 116
      Width = 77
      Height = 17
      Hint = 'Indica si es un evento de notificacion de citaci'#243'n'
      Caption = 'Notificaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
    end
    object chkResponsable: TCheckBox
      Left = 12
      Top = 140
      Width = 85
      Height = 17
      Hint = 'Indica si es obligatorio el responsable'
      Caption = 'Responsable'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object chkSegTerreno: TCheckBox
      Left = 106
      Top = 140
      Width = 85
      Height = 17
      Hint = 'Indica si es un evento de seguimiento en terreno'
      Caption = 'Seg. Terreno'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object chkDerInterior: TCheckBox
      Left = 195
      Top = 140
      Width = 77
      Height = 17
      Hint = 'Indica si es derivacion al interior'
      Caption = 'Der. Interior'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
    end
    object chkEventoSRT: TCheckBox
      Left = 282
      Top = 140
      Width = 77
      Height = 17
      Hint = 'Indica si el evento es de para SRT'
      Caption = 'Evento SRT'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object chkAmerita: TCheckBox
      Left = 379
      Top = 140
      Width = 61
      Height = 17
      Hint = 'Indica si el evento es de amerita recalificaci'#243'n'
      Caption = 'Amerita'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
    end
    object chkProfesional: TCheckBox
      Left = 477
      Top = 140
      Width = 77
      Height = 17
      Hint = 'Indica si el evento exige profesional'
      Caption = 'Profesional'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
    end
    object chkFecAntAlta: TCheckBox
      Left = 561
      Top = 140
      Width = 89
      Height = 17
      Hint = 'Indica si el evento permite cartas anteriores a la actual'
      Caption = 'Fec. Ant. Alta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
    object chkRecaDictamen: TCheckBox
      Left = 12
      Top = 164
      Width = 89
      Height = 17
      Hint = 'Indica si el evento permite la marca Reca/Dictamen'
      Caption = 'Reca Dictamen'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
    end
    object chkSugReca: TCheckBox
      Left = 106
      Top = 164
      Width = 73
      Height = 17
      Hint = 
        'Indica si se envia el aviso de Paciente con sugerencia de reca e' +
        'n tto.'
      Caption = 'Sug. Reca'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
    end
    object chkSeguimientoSin: TCheckBox
      Left = 195
      Top = 164
      Width = 82
      Height = 17
      Hint = 
        '-'#9'Seguimiento sin: Indica en el listado de Seguimientos de Recal' +
        'ificacion que excluye este evento para realizarlo'
      Caption = 'Seguim. Sin'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
    end
    object chkSeguimientoCon: TCheckBox
      Left = 282
      Top = 164
      Width = 85
      Height = 17
      Hint = 
        'Indica en el listado de Seguimientos de Recalificacion que inclu' +
        'ye este evento para realizarlo'
      Caption = 'Seguim. Con'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
    end
    object chkTelegramaProf: TCheckBox
      Left = 379
      Top = 164
      Width = 97
      Height = 17
      Hint = 
        'Indica si el Evento corresponde a una citaci'#243'n del accidentado a' +
        ' Revisi'#243'n M'#233'dica'
      Caption = 'Telegrama Prof.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
    end
    object chkTelegramaPrest: TCheckBox
      Left = 477
      Top = 164
      Width = 97
      Height = 17
      Hint = 
        'Indica si el Evento da la opcion de enviar el telegrama informan' +
        'do al trabajador de la prestaci'#243'n por solicitud de Dict'#225'men'
      Caption = 'Telegrama Prest.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
    end
    object gbGeneraAut: TGroupBox
      Left = 8
      Top = 204
      Width = 658
      Height = 77
      TabOrder = 31
      object Label4: TLabel
        Left = 7
        Top = 28
        Width = 39
        Height = 13
        Caption = 'Prestac.'
      end
      object Label5: TLabel
        Left = 7
        Top = 53
        Width = 45
        Height = 13
        Caption = 'Prestador'
      end
      object Label6: TLabel
        Left = 360
        Top = 28
        Width = 50
        Height = 13
        Caption = 'G. Trabajo'
      end
      object chkGeneraAutoriz: TCheckBox
        Left = 4
        Top = 8
        Width = 97
        Height = 17
        Hint = 'Indica si genera autorizacion autom'#225'tica'
        Caption = 'Genera Autoriz.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = chkGeneraAutorizClick
      end
      inline fraGTrabajo: TfraCodigoDescripcion
        Left = 413
        Top = 23
        Width = 237
        Height = 23
        Hint = 'Grupo de trabajo para la autorizacion que se genera autom'#225'tica'
        TabOrder = 2
        inherited cmbDescripcion: TArtComboBox
          Width = 172
        end
      end
      inline fraPrestador: TfraPrestador
        Left = 64
        Top = 47
        Width = 584
        Height = 23
        Hint = 
          'Indica el prestador para la autorizacion que se genera autom'#225'tic' +
          'a'
        VertScrollBar.Range = 49
        AutoScroll = False
        TabOrder = 3
        inherited lbCPostal: TLabel
          Left = 495
        end
        inherited lbTelefono: TLabel
          Left = 407
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 112
        end
        inherited cmbPrestador: TArtComboBox
          Width = 237
        end
        inherited edPresLocalidad: TEdit
          Width = 141
        end
        inherited edPresCPostal: TEdit
          Left = 512
        end
        inherited edPresTelefono: TEdit
          Left = 408
        end
      end
      inline fraPrestacion: TfraCodigoDescripcion
        Left = 48
        Top = 23
        Width = 295
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 230
        end
      end
    end
    object chkCapInt: TCheckBox
      Left = 12
      Top = 188
      Width = 61
      Height = 17
      Hint = 
        'Indica si para el evento se debe ingresar si es de Capital o Int' +
        'erior'
      Caption = 'Cap Int'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 28
    end
    object chkIniciaReca: TCheckBox
      Left = 106
      Top = 188
      Width = 81
      Height = 17
      Hint = 
        'Indica que de existir este evento, no se podr'#225' marcar como RECA ' +
        'desde el PEV'
      Caption = 'Inicia Reca'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 29
    end
    object edEventoAuto: TEdit
      Left = 477
      Top = 184
      Width = 91
      Height = 21
      Hint = 'C'#243'digo del evento autom'#225'tico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 30
    end
    object edDigitaliza: TEdit
      Left = 209
      Top = 90
      Width = 61
      Height = 21
      Hint = 'Codigo de digitalizacion (si corresponde)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object edEventoAnt: TEdit
      Left = 282
      Top = 184
      Width = 91
      Height = 21
      Hint = 'Indica cual es el evento que se exige antes de cargar '#233'ste'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 34
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select * from SIN.sem_eventomedicoreca')
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
