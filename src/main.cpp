// Copyright [2025] B. Alfaro, D. Orias, E. Ramírez, J. Rodríguez
#include <stdio.h>
#include "Window.h"
#include "Game.h"

int main() {
  // Componentes
  Window window;
  Game mainGame;

  // Inicializacion de componentes
  window.initializeWindow();
  mainGame.initializeGame();

  // Ciclo del juego
  std::uint8_t inGame = 0;

  while (!WindowShouldClose()) {
    window.beginWindowDraw();
    inGame = 1;
    if (inGame) {  // partida
      mainGame.setInteractable();
      mainGame.drawGameElements();
    } 
    window.endWindowDraw();
  }
  window.killWindow();  // Cierra la vantana
  return 0;
}
