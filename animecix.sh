
klasor_yolu="/Apps"

if [ -d "$klasor_yolu" ]; then
    echo "Klasör mevcut."
    ls "$klasor_yolu"
else
    echo "Klasör bulunamadı, oluşturuluyor"
    sudo mkdir -p "$klasor_yolu"
    echo "Klasör oluşturuldu."
fi

paket_adi="fuse"

if dpkg -s "$paket_adi" &> /dev/null; then
    echo "$paket_adi paketi yüklü."
else
    echo "$paket_adi paketi yüklü değil, yükleniyor"
    sudo apt install fuse -y
fi
clear

dosya_url="https://github.com/CaptainSP/animecix-desktop/releases/download/v1.2.5/AnimeciX-1.2.5.AppImage"
icon_url="https://raw.githubusercontent.com/uwuv3/emptyv2/main/animecix.png"
script_url="https://raw.githubusercontent.com/uwuv3/emptyv2/main/animecix.sh"

dosya_adi="AnimeciX.AppImage"
script_adi="AnimeciX.sh"
icon_adi="animecix.png"

indirilecek_dosya="$klasor_yolu/$dosya_adi"
indirilecek_icon="$klasor_yolu/$icon_adi"
indirilecek_script="$klasor_yolu/$script_adi"

if [ -e "$indirilecek_dosya" ]; then
    echo "Dosya başarıyla indirildi: $indirilecek_dosya"
else
  sudo wget -O "$indirilecek_dosya" "$dosya_url"
fi
if [ -e "$indirilecek_icon" ]; then
    echo "Dosya başarıyla indirildi: $indirilecek_icon"
else
 sudo wget -O "$indirilecek_icon" "$icon_url"
fi
if [ -e "$indirilecek_script" ]; then
    echo "Dosya başarıyla indirildi: $indirilecek_script"
else
 sudo wget -O "$indirilecek_script" "$script_url"
fi
if [ -e "$indirilecek_dosya" ]; then
echo ""
else
echo "indirilemedi"
exit 1
fi

if [ -e "$indirilecek_icon" ]; then
echo ""
else
echo "indirilemedi"
exit 1
fi


echo "İzin veriliyor"
sudo chmod +x "$indirilecek_dosya"
sudo chmod +x "$indirilecek_icon"
sudo chmod +x "$indirilecek_script"
echo "İzin verildi"
echo ".desktop oluşturuluyor"
echo -e "[Desktop Entry]\nName=Animecix\nExec=\"cd /Apps && ./$script_adi\"\nIcon=$indirilecek_icon\nType=Application\nCategories=UtilityAudioVideo;" > Animecix.desktop
echo -e "[Desktop Entry]\nName=Animecix\nExec=\"cd /Apps && ./$script_adi\"\nIcon=$indirilecek_icon\nType=Application\nCategories=UtilityAudioVideo;" > ~/.local/share/applications/Animecix.desktop
clear
if [ -e "$indirilecek_script" ]; then
cd /Apps && ./$dosya_adi
else
echo "indirilemedi"
exit 1
fi
