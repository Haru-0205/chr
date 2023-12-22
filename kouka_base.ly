#(define (tie::tab-clear-tied-fret-numbers grob)
   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))
      (ly:grob-set-property! tied-fret-nr 'transparent #t)))

\version "2.14.0"
\paper {
   indent = #0
   print-all-headers = ##t
   ragged-right = ##f
   ragged-bottom = ##t
}
\layout {
   \context { \Score
      \override MetronomeMark #'padding = #'5
   }
   \context { \Staff
      \override TimeSignature #'style = #'numbered
      \override StringNumber #'transparent = ##t
   }
   \context { \TabStaff
      \override TimeSignature #'style = #'numbered
      \override Stem #'transparent = ##t
      \override Beam #'transparent = ##t
      \override Tie  #'after-line-breaking = #tie::tab-clear-tied-fret-numbers
   }
   \context { \TabVoice
      \override Tie #'stencil = ##f
   }
   \context { \StaffGroup
      \consists "Instrument_name_engraver"
   }
}
TrackAVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)
#{
   \tempo 4=100
   \clef #(if $inTab "tab" "treble_8")
   \key c \major
   \time 4/4
   \oneVoice
   <c\5 e\4 a\3 >4 <c\5 e\4 >4 <c\5 f\4 >4 <c\5 e\4 g,\6 >4 
   <c\5 e\4 >4 <c\5 e\4 g\3 >4 <c\5 e\4 >4 <a,\5 f\4 >4 
   <e\4 g\3 >8 r8 <g\3 b\2 >8 r8 <a\3 c'\2 >8 r8 <c\5 e\4 >8. r16 
   <c\5>4 <c\5 g\3 >4 <e\4 c\5 g\3 >4 <c\5 g\3 >4 
   <c\5 e\4 g\3 >4 <c\5 g\3 >4 <c\5 f\4 a\3 >4 <c\5 a\3 >4 
   <c\5 f\4 >4 <a,\5 d\4 >4 <g,\6 b,\5 d\4 >2 
   <e\4 c\5 >4 <f\4>4 <e\4 g\3 >4 <d\4 e\5 >4 
   <g,\6 e\4 >4 <g\3 e\4 >4 <c\5 e\4 >4 <c\5>4 
   <c\5 e\4 >4 <c\5>8 <c\5 g\3 >8 <e\4 g\3 c'\2 >4 <g\3 e\4 c\5 >4 
   <c\5 f\4 a\3 >4 <c\5 f\4 a\3 >4 <c\5 f\4 a\3 >4 <c\5 g\3 e\4 >4 
   <c\5 f\4 >4 <c\5 f\4 a\3 >4 <c\5 f\4 >4 <e\4 g\3 b\2 >4 
   <b\2 d'\3 g\4 >1 
   <c'\2 e'\1 >4. <a\3>8 <d'\2 g\3 b\4 >4 <e\4 g\3 c'\2 >4 
   <f\4 a\3 c'\2 >4 <f\4 a\3 c'\2 >4 <e\4 g\3 c'\2 >4 <e\4 g\3 c\5 >4 
   <c\5 e\4 g\3 >4 <c\5 e\4 g\3 >4 <e\4 c\5 a,\6 >4 <e\4 g\3 c'\2 >4 
   <g\3 b\2 e\4 >2 r2 
   <c\5 e\4 g\3 >4 <c'\2 e\4 g\3 >4 <f\4 a\3 c'\2 >4 <g\3 e\4 c'\2 >4 
   <c\5 e\4 g\3 >4 <c\5 e\4 g\3 >4 <f\4 c\5 a\3 >4 <g\3 c\5 e\4 >4 
   <f\4 d\5 >8. r16 <d\4 g\3 >8. r16 <e\4 a\3 c'\2 e'\1 >4 r4 
   \bar "|."
   \pageBreak
#})
TrackAVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)
#{
#})
TrackALyrics = \lyricmode {
   \set ignoreMelismata = ##t
   
   \unset ignoreMelismata
}
TrackAStaff = \new Staff <<
   \context Voice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \TrackAVoiceAMusic ##f
   }
   \context Voice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \TrackAVoiceBMusic ##f
   }
>>
TrackATabStaff = \new TabStaff \with { stringTunings = #`( ,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<
   \context TabVoice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceAMusic ##t
   }
   \context TabVoice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceBMusic ##t
   }
>>
TrackAStaffGroup = \new StaffGroup <<
   \TrackAStaff
>>
\score {
   \TrackAStaffGroup
   \header {
      title = "" 
      composer = "" 
      instrument = "" 
   }
}
