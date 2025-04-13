#Requires AutoHotkey v2.0

; Отключение стандартных диалоговых окон ошибок
#Warn All, Off


;#########################################################
; двойное нажатие Alt переключает язык ввода

; Константа для переключения раскладки
WM_INPUTLANGCHANGEREQUEST := 0x0050

; Двойное нажатие Left Alt - переключение на следующий язык
~$LAlt::{
    if (A_PriorHotkey = "~$LAlt" && A_TimeSincePriorHotkey < 300) {
        try {
            hwnd := WinGetID("A")
            if (hwnd) {
                PostMessage(WM_INPUTLANGCHANGEREQUEST, 0, 0x01, , "ahk_id " hwnd)
            }
        } catch {
            return
        }
    }
    return
}
