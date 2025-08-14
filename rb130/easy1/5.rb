def rot13(char)
  if ('a'..'z').include?(char)
    start = 'a'.ord
  elsif ('A'..'Z').include?(char)
    start = 'A'.ord
  else
    return char
  end

  rotate = (char.ord - start + 13) % 26
  (start + rotate).chr
end


names_str = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

names_str.split("\n").each do |name|
  puts name.chars.map { |char| rot13(char) }.join
end
