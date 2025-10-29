// Copyright [2025] B. Alfaro, D. Orias, E. Ramírez, J. Rodríguez
#include "Game.h"

void Game::updateElements() {
  this->player.movePlayer();

}

void Game::initializeGame() {
  // Inicializacion de los elementos
  this->player.initializePlayer();
  // Dice que la escena es interactuable
  this->interactable = 0;
}

void Game::drawGameElements() {
  if (interactable) updateElements();
  this->player.drawPlayer();

}

