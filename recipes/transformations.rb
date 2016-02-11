include_recipe "build-essential::default"
include_recipe "libreoffice::default"
include_recipe "imagemagick::default"

if node['platform_family'] == "ubuntu"
  include_recipe "ffmpeg::default"
  include_recipe "swftools::default"
elsif node['platform_family'] == "rhel"
  install_fonts = node['alfresco']['install_fonts']
  exclude_font_packages = node['alfresco']['exclude_font_packages']

  # TODO - implement it also for Ubuntu using apt-get
  execute "install-all-fonts" do
    command "yum install -y *fonts.noarch --exclude='#{exclude_font_packages}'"
    only_if { install_fonts and node['platform_family'] == "rhel" }
  end

  bash 'install_swftools_libreoffice_more' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    yum-config-manager --enable rhui-REGION-rhel-server-optional
    yum-config-manager --enable rhui-REGION-rhel-server-source-optional
    yum install -y wget python-pip python-cheetah libffi-devel openssl-devel epel-release zlib zlib-devel freetype-devel jpeglib-devel giflib giflib-devel libjpeg-turbo-devel perl-Image-ExifTool gcc-c++ ImageMagick libreoffice libreoffice-headless
    pip install --upgrade pip
    curl -# -O http://www.swftools.org/swftools-2013-04-09-1007.tar.gz
    tar -zxf swftools-2013-04-09-1007.tar.gz
    cd swftools-2013-04-09-1007
    ./configure --libdir=/usr/lib64 --bindir=/usr/local/bin
    make && make install
    cd ..
    rm -fr swftools-2013-04-09-1007*
    EOH
    not_if "test -f /usr/local/bin/pdf2swf"
  end
end

package "libreoffice-headless" do
  action :install
end

package "perl-Image-ExifTool" do
  action :install
end
