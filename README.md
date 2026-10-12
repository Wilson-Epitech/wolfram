<div align="center">

# Wolfram

**Les automates cellulaires élémentaires de Wolfram, dans le terminal.**

<img alt="Haskell" src="https://img.shields.io/badge/Haskell-5D4F85?style=for-the-badge&logo=haskell&logoColor=white"/> <img alt="Stack" src="https://img.shields.io/badge/Stack-5D4F85?style=for-the-badge"/>

<sub>Projet solo · 2024</sub>

</div>

<br/>

<p align="center"><img src=".github/assets/wolfram.gif" alt="Wolfram" width="820"/></p>

## En deux mots

Mon premier projet en Haskell. Chaque ligne est calculée à partir de la précédente selon une règle de 0 à 255. Quelques règles donnent des motifs étonnants : la 30 est chaotique, la 90 dessine un triangle de Sierpiński, et la 110 est Turing-complète.

## Ce que ça fait

- N'importe quelle règle de 0 à 255
- Options `--rule`, `--start`, `--lines`, `--window`, `--move`
- Générations calculées paresseusement : la liste est infinie, on n'affiche que ce qu'on demande
- Gestion des erreurs d'arguments avec code de sortie 84

## Sous le capot

La règle est convertie en 8 bits : chaque voisinage de 3 cellules donne l'état suivant. Les générations forment une liste infinie, et l'affichage ne prend que la fenêtre et le nombre de lignes demandés.

## Lancer le projet

```bash
make
./wolfram --rule 30 --lines 30 --window 100
./wolfram --rule 90 --lines 32 --window 100
./wolfram --rule 110 --lines 30 --window 100 --move -30
```
