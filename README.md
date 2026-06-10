# 🏁 MotoSektory – F1 GPS Sector Timing

**MotoSektory** je prémiová webová aplikace pro GPS měření sektorů a telemetrii pro motorkáře a okruhové jezdce. Vzhled a rozhraní jsou kompletně inspirovány grafikou přenosů **Formula 1** (časomíra, barevné sektory, delta časy, karbonové detaily a neonové záře).

Aplikace funguje čistě v prohlížeči (frontend) bez nutnosti instalovat složité servery nebo databáze, což umožňuje bezplatné hostování přímo na **GitHub Pages** a snadné používání na mobilním telefonu venku na trati.

---

## 🚀 Hlavní Funkce

- **📺 F1 Broadcast Design:** Slidery sektorů zkosené o `-12°` s Orbitron fontem, karbonová textura na panelech a interaktivní zkosená F1 tlačítka s neonovou signalizací.
- **⚡ Rychloměr (Telemetry HUD):** Kruhový rychloměr v rohu mapy se svítícím SVG obloukem, který se plní podle rychlosti (škála do 180 km/h) a velkými svítícími číslicemi.
- **🛣️ Glowing Racetrack (Neonová trať):** Trasa vykreslená pomocí 3 překrývajících se vrstev pro docílení efektu zářící laserové závodní lajny (neonově červené tělo se svítícím bílým jádrem).
- **🔄 Živý Flow Efekt:** Během měření se trať aktivního sektoru animovaně vlní/pohybuje, hotové sektory se vybarví podle dosaženého času (Fialová = osobní rekord, Zelená = stabilní čas, Žlutá = pomalejší).
- **📍 Detekce Zatáček (Corner Apex Markers):** Matematický algoritmus analyzuje zakřivení trasy a automaticky na mapu umístí indikátory zatáček (`T1`, `T2`, `T3`...) přímo do vrcholů (apexů) zatáček.
- **📐 Snapping na silnici:** OSRM routování automaticky přichytí body na nejbližší reálnou silnici na mapě.
- **⏱️ Porovnávání a Delta:** Výpočet delta času (+/- sekundy) v reálném čase vůči předchozí jízdě nebo složenému osobnímu rekordu (optimální kolo sestavené z nejlepších sektorů).
- **💾 Lokální ukládání:** Trasy, nastavení a historie jízd se bezpečně ukládají přímo ve tvém prohlížeči (LocalStorage).
- **🤖 Integrované Demo:** Možnost spustit simulaci jízdy po naplánované trase pro vizuální kontrolu funkčnosti a designu telemetrie.

---

## 📱 Jak to spustit na mobilu (přes GitHub Pages)

Jelikož měření GPS vyžaduje být venku na motorce, nejjednodušší způsob je hostovat aplikaci zdarma přímo na GitHubu:

1. **Vytvoř si repozitář:** Založ si na svém GitHub účtu nový repozitář (např. s názvem `Sektors`).
2. **Nahraj soubory:** Nahraj do něj soubory `index.html` a `.gitignore`.
3. **Aktivuj GitHub Pages:**
   - Jdi do **Settings** (Nastavení) tvého repozitáře.
   - V levém menu klikni na **Pages**.
   - V sekci *Build and deployment* pod nadpisem *Source* vyber **Deploy from a branch**.
   - Pod tím v rozbalovacím menu *Branch* zvol **main** (případně *master*) a klikni na **Save**.
4. **HOTOVO!** Během minuty GitHub vygeneruje veřejnou adresu (např. `https://tvoje-jmeno.github.io/Sektors/`), kterou si můžeš otevřít v mobilním telefonu a vyrazit jezdit.

> [!IMPORTANT]
> Moderní prohlížeče vyžadují zabezpečené připojení (HTTPS) pro přístup k senzoru GPS polohy. GitHub Pages běží automaticky na HTTPS, takže GPS měření bude na mobilu fungovat bez problémů.

---

## 💻 Lokální spuštění na PC (pro vývoj/testování)

Pokud chceš testovat nebo upravovat aplikaci na počítači:

1. Klikni pravým tlačítkem na soubor `start-server.ps1` a zvol **Spustit s rutinami PowerShell** (případně spusť v terminálu: `.\start-server.ps1`).
2. Server se spustí na adrese `http://localhost:8080`.
3. Otevři tuto adresu ve svém prohlížeči.
4. Kliknutím na tlačítko **⚡ Demo** můžeš ihned otestovat průjezd trasou a sledovat telemetrii.

*Poznámka: Localhost má výjimku z bezpečnostních pravidel prohlížečů, takže GPS/lokální simulace na něm funguje i bez HTTPS.*
