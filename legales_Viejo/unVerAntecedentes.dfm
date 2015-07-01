object frmVerAntecedente: TfrmVerAntecedente
  Left = 217
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Ver Antecedente'
  ClientHeight = 514
  ClientWidth = 508
  Color = clBtnFace
  Constraints.MaxHeight = 541
  Constraints.MaxWidth = 516
  Constraints.MinHeight = 539
  Constraints.MinWidth = 514
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    508
    514)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = -98
    Top = 474
    Width = 606
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnCerrarAntecedente: TButton
    Left = 410
    Top = 483
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Cerrar'
    ModalResult = 1
    TabOrder = 0
  end
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 508
    Height = 474
    ActivePage = tsPrincipal
    Align = alTop
    TabOrder = 1
    object tsPrincipal: TTabSheet
      Caption = 'Antecedente'
      DesignSize = (
        500
        446)
      object Label1: TLabel
        Left = 9
        Top = 10
        Width = 49
        Height = 13
        Caption = 'Nro. Req.:'
      end
      object Label2: TLabel
        Left = 164
        Top = 10
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label3: TLabel
        Left = 9
        Top = 36
        Width = 50
        Height = 13
        Caption = 'Area SRT:'
      end
      object Label4: TLabel
        Left = 305
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Cant. Hojas:'
      end
      object lblDelegacion: TLabel
        Left = 9
        Top = 61
        Width = 57
        Height = 13
        Caption = 'Delegaci'#243'n:'
      end
      object Label5: TLabel
        Left = 9
        Top = 85
        Width = 46
        Height = 13
        Caption = 'Rechazo:'
      end
      object Label6: TLabel
        Left = 9
        Top = 109
        Width = 44
        Height = 13
        Caption = 'Revisi'#243'n:'
      end
      object Label8: TLabel
        Left = 9
        Top = 133
        Width = 61
        Height = 13
        Caption = 'F. Aceptado:'
      end
      object Label9: TLabel
        Left = 165
        Top = 133
        Width = 61
        Height = 13
        Caption = 'F. Descargo:'
      end
      object Label10: TLabel
        Left = 9
        Top = 157
        Width = 62
        Height = 13
        Caption = 'F. Generado:'
      end
      object Label11: TLabel
        Left = 165
        Top = 157
        Width = 55
        Height = 13
        Caption = 'F. Pr'#243'rroga:'
      end
      object Label12: TLabel
        Left = 301
        Top = 157
        Width = 67
        Height = 13
        Caption = 'F. Recepci'#243'n:'
      end
      object Label13: TLabel
        Left = 301
        Top = 133
        Width = 66
        Height = 13
        Caption = 'F. Respuesta:'
      end
      object Label14: TLabel
        Left = 165
        Top = 181
        Width = 61
        Height = 13
        Caption = 'Vencimiento:'
      end
      object Label15: TLabel
        Left = 9
        Top = 205
        Width = 43
        Height = 13
        Caption = 'Firmante:'
      end
      object Label16: TLabel
        Left = 9
        Top = 229
        Width = 53
        Height = 13
        Caption = 'Firma SRT:'
      end
      object Label17: TLabel
        Left = 9
        Top = 253
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label18: TLabel
        Left = 201
        Top = 253
        Width = 85
        Height = 13
        Caption = 'Estado Descargo:'
      end
      object Label20: TLabel
        Left = 9
        Top = 277
        Width = 65
        Height = 13
        Caption = 'Sector Resp.:'
      end
      object Label19: TLabel
        Left = 9
        Top = 301
        Width = 58
        Height = 13
        Caption = 'Img. Recep:'
      end
      object Label21: TLabel
        Left = 9
        Top = 325
        Width = 49
        Height = 13
        Caption = 'Img Form.:'
      end
      object Label22: TLabel
        Left = 9
        Top = 349
        Width = 64
        Height = 13
        Caption = 'Motivo Rech:'
      end
      object Label23: TLabel
        Left = 9
        Top = 373
        Width = 66
        Height = 13
        Caption = 'Motivo Resp.:'
      end
      object Label24: TLabel
        Left = 9
        Top = 397
        Width = 82
        Height = 13
        Caption = 'Mot.Sol.Pr'#243'rroga:'
      end
      object Label26: TLabel
        Left = 9
        Top = 421
        Width = 49
        Height = 13
        Caption = 'Nro. Nota:'
      end
      object Label27: TLabel
        Left = 169
        Top = 421
        Width = 45
        Height = 13
        Caption = 'Nro SRT:'
      end
      object Label39: TLabel
        Left = 9
        Top = 181
        Width = 58
        Height = 13
        Caption = 'Fecha SRT:'
      end
      object edNroRequerimiento: TEdit
        Left = 94
        Top = 6
        Width = 57
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 0
      end
      object edEstado: TEdit
        Left = 204
        Top = 6
        Width = 90
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 1
      end
      object edAreaSrt: TEdit
        Left = 94
        Top = 32
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 2
      end
      object edCantidadHojas: TEdit
        Left = 366
        Top = 6
        Width = 90
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 3
      end
      object edDelegacion: TEdit
        Left = 94
        Top = 57
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 4
      end
      object edRechazo: TEdit
        Left = 94
        Top = 81
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 5
      end
      object edRevision: TEdit
        Left = 94
        Top = 105
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 6
      end
      object edFechaAceptado: TEdit
        Left = 94
        Top = 129
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 7
      end
      object edFechaDescargo: TEdit
        Left = 230
        Top = 129
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 8
      end
      object edFechaGenerado: TEdit
        Left = 94
        Top = 153
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 9
      end
      object edFechaProrroga: TEdit
        Left = 230
        Top = 153
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 10
      end
      object edFechaRecepcion: TEdit
        Left = 371
        Top = 153
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 11
      end
      object edFechaRespuesta: TEdit
        Left = 371
        Top = 129
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 12
      end
      object edVencimiento: TEdit
        Left = 230
        Top = 177
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 13
      end
      object edFirmante: TEdit
        Left = 94
        Top = 201
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 14
      end
      object edFirmaSRT: TEdit
        Left = 94
        Top = 225
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 15
      end
      object edEstado2: TEdit
        Left = 94
        Top = 249
        Width = 103
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 16
      end
      object edEstadoDescargo: TEdit
        Left = 289
        Top = 249
        Width = 167
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 17
      end
      object edSectorResponsable: TEdit
        Left = 94
        Top = 273
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 18
      end
      object edImagenRecepcion: TEdit
        Left = 94
        Top = 297
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 19
      end
      object edImgForm: TEdit
        Left = 94
        Top = 321
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 20
      end
      object edMotivoRechazo: TEdit
        Left = 94
        Top = 345
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 21
      end
      object edMotivoRespuestaParcial: TEdit
        Left = 94
        Top = 369
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 22
      end
      object edMotivoSolicitud: TEdit
        Left = 94
        Top = 393
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 23
      end
      object tbrVerImgRecep: TToolBar
        Left = 458
        Top = 320
        Width = 31
        Height = 29
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        HotImages = dmLegales.ilColor
        Images = dmLegales.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        object tbSeleccionImgRecep: TToolButton
          Left = 0
          Top = 2
          Hint = 'Seleccionar Archivos'
          ImageIndex = 26
          OnClick = tbSeleccionImgRecepClick
        end
      end
      object ToolBar1: TToolBar
        Left = 458
        Top = 296
        Width = 31
        Height = 26
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        HotImages = dmLegales.ilColor
        Images = dmLegales.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        object tbImgForm: TToolButton
          Left = 0
          Top = 2
          Hint = 'Seleccionar Archivos'
          ImageIndex = 26
          OnClick = tbImgFormClick
        end
      end
      object edNroNota: TEdit
        Left = 94
        Top = 416
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 26
      end
      object edNroSrt: TEdit
        Left = 217
        Top = 416
        Width = 80
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 27
      end
      object edFechaSRT: TEdit
        Left = 94
        Top = 177
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 28
      end
    end
    object tsMasDatos: TTabSheet
      Caption = 'M'#225's Datos'
      ImageIndex = 1
      DesignSize = (
        500
        446)
      object Label28: TLabel
        Left = 9
        Top = 10
        Width = 63
        Height = 13
        Caption = 'Observaci'#243'n:'
      end
      object Label29: TLabel
        Left = 9
        Top = 106
        Width = 59
        Height = 13
        Caption = 'Obs. Sector:'
      end
      object Label30: TLabel
        Left = 9
        Top = 201
        Width = 79
        Height = 13
        Caption = 'Pedido Pr'#243'rroga:'
      end
      object Label31: TLabel
        Left = 9
        Top = 226
        Width = 69
        Height = 13
        Caption = 'Plazo Entrega:'
      end
      object Label32: TLabel
        Left = 169
        Top = 226
        Width = 62
        Height = 13
        Caption = 'Recibo SRT:'
      end
      object Label33: TLabel
        Left = 9
        Top = 251
        Width = 55
        Height = 13
        Caption = 'Referencia:'
      end
      object Label34: TLabel
        Left = 9
        Top = 275
        Width = 50
        Height = 13
        Caption = 'Referente:'
      end
      object Label36: TLabel
        Left = 9
        Top = 300
        Width = 80
        Height = 13
        Caption = 'Resp. Descargo:'
      end
      object Label37: TLabel
        Left = 9
        Top = 322
        Width = 66
        Height = 13
        Caption = 'Resp. Parcial:'
      end
      object Label38: TLabel
        Left = 9
        Top = 380
        Width = 60
        Height = 13
        Caption = 'Resp. Word:'
      end
      object edObservacion: TMemo
        Left = 94
        Top = 8
        Width = 363
        Height = 89
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 0
      end
      object edObservacionSector: TMemo
        Left = 94
        Top = 104
        Width = 363
        Height = 89
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 1
      end
      object edPedidoProrroga: TEdit
        Left = 94
        Top = 197
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 2
      end
      object edPlazoEntrega: TEdit
        Left = 94
        Top = 222
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 3
      end
      object edReciboSRT: TEdit
        Left = 237
        Top = 222
        Width = 66
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 4
      end
      object edReferencia: TEdit
        Left = 94
        Top = 247
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 5
      end
      object edReferente: TEdit
        Left = 94
        Top = 271
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 6
      end
      object ToolBar2: TToolBar
        Left = 458
        Top = 294
        Width = 35
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        HotImages = dmLegales.ilColor
        Images = dmLegales.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        object tbRespDescargo: TToolButton
          Left = 0
          Top = 0
          Hint = 'Seleccionar Archivos'
          ImageIndex = 26
          OnClick = tbRespDescargoClick
        end
      end
      object edRespDescargo: TEdit
        Left = 94
        Top = 296
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 8
      end
      object edRespParcial: TMemo
        Left = 94
        Top = 321
        Width = 363
        Height = 49
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 9
      end
      object ToolBar3: TToolBar
        Left = 457
        Top = 374
        Width = 33
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        HotImages = dmLegales.ilColor
        Images = dmLegales.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        object tbRespWord: TToolButton
          Left = 0
          Top = 0
          Hint = 'Seleccionar Archivos'
          ImageIndex = 26
          OnClick = tbRespWordClick
        end
      end
      object edRespWord: TEdit
        Left = 94
        Top = 376
        Width = 363
        Height = 21
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 11
      end
    end
  end
end
