class Gloam < Formula
  include Language::Python::Virtualenv

  desc "Internet radio and music player with an audio-reactive terminal visualiser"
  homepage "https://github.com/londonpixelexchange/gloam"
  url "https://github.com/londonpixelexchange/gloam.git",
      tag:      "v1.1.1",
      revision: "df8351c48dd6ec0d88415d52eeacb923c84c549c"
  license "MIT"
  head "https://github.com/londonpixelexchange/gloam.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "libffi"
  depends_on "numpy"
  depends_on "portaudio"
  depends_on "python@3.14"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/51/33/4cd27639502f010084bcef7a2036391dd637439901341ce1a530f36f6e51/certifi-2026.11.20.tar.gz"
    sha256 "af1cb240a8133f105aa52684a3a3258339d7f2fd0bd4e2812698ff5cf5588c4e"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f/cffi-2.1.1.tar.gz"
    sha256 "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/cb/27/eeb9f307bf07060f3d9f9aa0fb8c15b01bdfded0a941e4b2719c7f94cacd/pycparser-3.12.tar.gz"
    sha256 "f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2ce915475cf1db6"
  end

  resource "sounddevice" do
    url "https://files.pythonhosted.org/packages/ec/db/0c890e2d9aab9ba284021efc02e1d3aebfecab1b611762d7434602209bcf/sounddevice-0.5.6.tar.gz"
    sha256 "8ec9fbfde2e32f020b167e348f3ab3bac6625a5f15af524d790108ac7147a410"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14", system_site_packages: false)
    %w[certifi pycparser cffi].each do |name|
      venv.pip_install resource(name)
    end
    resource("sounddevice").stage do
      # ctypes cannot reliably find Homebrew's PortAudio on Apple silicon.
      portaudio_library = (formula_opt_lib("portaudio")/shared_library("libportaudio")).to_s.inspect
      inreplace "src/sounddevice.py", "_libname = _find_library(_libname)",
                "_libname = #{portaudio_library}"
      venv.pip_install Pathname.pwd
    end
    libexec.install "gloam"
    (bin/"gloam").write <<~SH
      #!/bin/sh
      exec "#{libexec}/bin/python" "#{libexec}/gloam" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gloam --version")
    assert_match "--vignette", shell_output("#{bin}/gloam --help")
    system libexec/"bin/python", "-c", <<~PYTHON
      import certifi
      import numpy as np
      import runpy
      import sounddevice
      assert sounddevice.get_portaudio_version()[0] > 0
      gloam = runpy.run_path("#{libexec}/gloam")
      field = gloam["Field"](9, 9, 1, 1, vignette=0.5, background=(17, 34, 51))
      colours, _ = field.colours(0, "ember", None, 0, 0, 100)
      np.testing.assert_array_equal(colours[0, 0], [17, 34, 51])
    PYTHON
  end
end
