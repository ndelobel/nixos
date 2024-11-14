{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk3,
  hicolor-icon-theme,
  jdupes,
}:
stdenvNoCC.mkDerivation rec {
  pname = "WhiteSur-icon-theme";
  version = "unstable-commit";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = "Whitesur-icon-theme";
    rev = "092d17fb1abaf0ea15eefc15d2e145a3737b45ea";
    hash = "sha256-l4NMZ/sG34tlbSki9bgGmRVtDPcT5eZU1iIMoEux19o=";
  };

  nativeBuildInputs = [gtk3 jdupes];

  buildInputs = [hicolor-icon-theme];

  dontPatchELF = true;
  dontRewriteSymlinks = true;
  dontDropIconThemeCache = true;

  postPatch = ''
    patchShebangs install.sh
  '';

  installPhase = ''
    runHook preInstall

    ./install.sh --dest $out/share/icons
                 --name WhiteSur
                 --alternative
                 --bold

    jdupes --link-soft --recurse $out/share

    runHook postInstall
  '';

  meta = with lib; {
    description = "MacOS Big Sur style icon theme for Linux desktops";
    homepage = "https://github.com/vinceliuice/WhiteSur-icon-theme";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
