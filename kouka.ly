\version "2.25.10"
\header {
    \title = \markup "大阪公立大学工業高等専門学校 校歌"
    \poet = "本校国語科 作詞"
    \composer = "田中龍三 作曲"
    \arranger = "谷口陽音 編曲"
    \subtitle = "同声2部合唱 v0.1"
}

\score {
    <<
    \new ChoirStaff <<
        \new Staff {
            \new Voice = "Sop" {
                \key c \major
                \clef treble
                \relative c' {
                    R1 | R1 | R1 |
                    e8. f16 g8 a g2 | g8 a4 g8 c8. c16 b8 a |
                    g8. g16 e8 e d2 | e8. d16 c8 a' g g f4 | e8 e d d c2 |
                    R1 | R1 | R1 | R1 |
                    e'4. e8 d4 c | a a g2 | a4 g e g | d2. r4 |
                    b8. c16 d8 d e e d4 | g8. c16 b8 a g4 a8 a | \acciaccatura d, d8. d16 g4 c r4  |
                }
            }
        }
        \new Lyrics \lyricsto "Sop" {
            \lyricmode {
                み ど り な す い こ ま や ま な み 
                あ お ぎ み る こ の ま な び や に つ ど い た り 
                ま な こ を あ げ て きょ う も ま た 
                ま な び に は げ む そ の な も おお さ か ふり つ こう せん
            }
        }
        \new Staff{
            \new Voice = "Alt" {
                \key c \major
                \clef treble
                \relative c' {
                    R1 | R1 | R1 |
                    R1 | R1 | d8. d16 b8 b a2 | b8. a16 g8 e' d d c4 | b8 b a a g2 |
                    g'2 a4 g | c8 b4 a8 g2 | a4 a g c | d2. r4 |
                    R1 | R1 | R1 | R1 |
                    e,8. f16 g8 g a a g4 | g8. c16 b8 a g4 a8 a | \acciaccatura d, d8. d16 g4 c r4
                }
            }
        }
        \new Lyrics \lyricsto "Alt" {
            \lyricmode {
                あ お ぎ み る こ の ま な び や に つ ど い た り 
                わ か き ち せ い の き よ ら な る
                ま な び に は げ む そ の な も おお さ か ふり つ こう せん
            }
        }
    >>
    \new PianoStaff <<
        \new Staff{ 
            \key c \major
            \clef treble
            \relative c' {
                e8. f16 g8 g a a g4 | g8. c16 b8 a g4 a8 a | \acciaccatura d, d8. d16 g4 c  <c, e g c>8. \arpeggio r16 | R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1
            }
        }
        \new staff {
            \key c \major
            \clef bass
            \relative c {
                <c e a>4 <c e> <c f> <c e g,> 
                <c e> <c e g> <c e> <a f'> 
                <e' g>4\staccato\accent <g b>4\staccato\accent <a c>4\staccato\accent r4
                c4 <c g'> <e c g'> <c g'> 
                <c e g> <c g'> <c f a> <c a'> 
                <c f> <a d> <g b d>2 
                <e' c>4 <c f> <e g> <d e> 
                <g, e'> <g' e> <c, e> c 
                <c e> c8 <c g'> <e g c>4 <g e c> 
                <c, f a> <c f a> <c f a> <c g' e > 
                <c f> <c f a > <c f> <e g b> 
                <b' g d'>1
                <c e>4. <a c e>8 <g b d>4 <e g c> 
                <f a c> <f a c> <e g c> <e g c,> 
                <c e g> <c e g> <e c a> <e g c> 
                <g b e,>2 r2 
                <c, e g>4 <e g c> <f a c> <g e c'> 
                <c, e g> <e g c,> <f a c,> <g c, e> 
                <f d>8. R16 <d g>8. R16 <e a c e>4 r4 
            }
        }

    >>
    >>
}