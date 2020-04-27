# xproject
Boards based on Zynq and Zynq UltraScale+ SOCs

1. Устанавливаем инструментарий Xilinx SDK 2018.2 и petlinux-2018.2 в каталог /opt/xilinx. Ссылка для скачивания:
   https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools/archive.html

2. Создаем символьные ссылки на каталоги с SDK и petalinux.
  
  cd /opt/xilinx
  ln -svf SDK/2018.2 sdk
  ln -svf petlalinux-2018.2 petalinux
   
2. Клонируем репозиторий проекта.

git clone https://github.com/insys-projects/xproject.git 

3. Выполняем сборку проекта используя скрипт makeproject.sh. В качестве параметра передать путь к каталогу с hdf-файлом 
проекта.

cd ~/xproject/scripts
source /opt/xilinx/petalinux/settings.sh
./makeproject.sh ../fmc130e_v12_z045_fmctest

4. Для настройки среды кросскомпиляции использовать скрипт envarm.sh

cd ~/xproject/scripts
source envarm.sh ../fmc130e_v12_z045_fmctest

5. Для выбора драйвера, работающего с субмодулями перед сборкой отредактирвать файл
   project-spec/meta-user/recipes-bsp/device-tree/files/fmc130e.dtsi
   Для использования AXI-DMA раскомментировать строку: /include/ "zdev.dtsi"
   Для использования тетрад раскомментировать строку:  /include/ "axidev.dtsi"
   вторую строку закомментировать.

6. При использовании AXO-DMA необходимо в конфигруации ядра Device Drivers -> DMA Engine Support 
   отключить поддержку драйвера AXI-DMA: < > Xilinx AXI DMAS Engine.

