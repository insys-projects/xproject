# xproject
Boards based on Zynq and Zynq UltraScale+ SOCs

1. Устанавливаем инструментарий Xilinx SDK 2018.3 и petlinux-2018.3 в каталог /opt/xilinx. Ссылка для скачивания:
   https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools/archive.html

2. Создаем символьные ссылки на каталоги с SDK и petalinux.
  
  cd /opt/xilinx
  ln -svf SDK/2018.3 sdk
  ln -svf petlalinux-2018.3 petalinux
   
2. Клонируем репозиторий проекта.

git clone https://github.com/insys-projects/xproject.git 

3. Выполняем сборку проекта используя скрипт liteproject.sh (liteproject_mp.sh - для ZynqMP). В качестве параметра передать путь к каталогу с hdf-файлом 
проекта.

cd ~/xproject/scripts
source /opt/xilinx/petalinux/settings.sh
./liteproject_mp.sh ../fmc_xxx_yyy

где xxx и yyy имя модуля и его версия.

4. Для настройки среды кросскомпиляции использовать скрипт envarm.sh или envarm64.sh передав в 
качестве параметра абсолютный путь к файлу проекта. Например:

cd ~/xproject/scripts
source ./envarm64.sh /home/karak/insys/xproject.git/fmc138m_v10_zu07_fm212x1g8/project

5. Для выбора драйвера, работающего с субмодулями перед сборкой отредактирвать файл
   project-spec/meta-user/recipes-bsp/device-tree/files/fmc130e.dtsi
   Для использования AXI-DMA раскомментировать строку: /include/ "zdev.dtsi"
   Для использования тетрад раскомментировать строку:  /include/ "axidev.dtsi"
   вторую строку закомментировать. Для модулей ZynqMP используется только драйвер zdev.

6. При использовании AXI-DMA необходимо в конфигруации ядра Device Drivers -> DMA Engine Support 
   отключить поддержку драйвера AXI-DMA: < > Xilinx AXI DMAS Engine.
