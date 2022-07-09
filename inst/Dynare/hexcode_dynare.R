# library(magrittr)
# d=dir("sagiru",".Rmd")
# k=dir("sagiru") %>% gsub(d,'',.) %>% file.remove(paste0("sagiru/",.),recursive = T,force = T)
#
#hexSticker::sticker("zyx.png",package = "EviewsR",s_width =1.8,s_height = 1.8,s_x = 1.27,s_y = 0.94,p_color = "#E391BC",spotlight=T,p_y = 1.8,h_color = "#01B5F2",white_around_sticker=T,url="www.smati.com.ng",u_size = 4,u_y = 0.079,u_x = 1.03)
# hexSticker::sticker("zyx.png",asp = 1.05,package = "EviewsR",s_width =1.9,s_height = 1.8,s_x = 1.26098,s_y = 0.94,p_color = "#01B5F2",spotlight=T,p_y = 1.8,h_color = "#01B5F2",white_around_sticker=T)
# hexSticker::sticker("Dynare.png",h_fill = "#FFFFFF",package = "DynareR",s_width =0.5,s_height = 0.5,s_x = 1,s_y = 1,p_color = "#F44646",spotlight=T,p_y = 1.6,p_x = 0.7,h_color = "#2285C5",white_around_sticker=T,url="www.smati.com.ng",u_size = 4,u_y = 0.18,u_x = 1.2,p_family="serif",p_fontface = "bold.italic",angle="30")
#
hexSticker::sticker("inst/Dynare/Dynare.png",h_fill = "#FFFFFF",package = "R",s_width =0.5,s_height = 0.5,s_x = 0.9,s_y = 1,p_color = "#FF7F66",spotlight=T,p_y = 1.02,p_x = 1.4,p_size = 25,h_color = "#2285C5",white_around_sticker=T,url="www.smati.com.ng",u_size = 4,u_y = 0.18,u_x = 1.2,p_family="serif",p_fontface = "bold",filename = "inst/Dynare/DynareR.png")
shell.exec("Dynarer.png")
# shell.exec("Eviewsr1.png")
