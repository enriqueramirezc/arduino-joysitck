// Copyright [2025] B. Alfaro, D. Orias, E. Ramírez, J. Rodríguez
#pragma once
#include "shared.h"
#include "Player.h"

/**
 * @brief Clase responsable de la partida en juego.
 */
class Game {
 private:
  // Path al botón de pausa
  const char* pause_button_path = "assets/mainGame/pause_button.png";
  // Objeto jugador humano
  Player player;

  // Indicador de si un elemento es interactuable
  std::uint8_t interactable;

  void updateElements();

 public:
  /**
   * @brief Inicializa los elementos de la clase,
   * carga sus texturas y posiciones.
   */
  void initializeGame();

  /**
   * @brief Rederiza los elementos de la partida en pantalla.
   */
  void drawGameElements();

  /**
   * @brief Cambia el estado del juego,
   * si la varible que cambia esta en 0
   * entonces los componentes se vuelven
   * no interactuales.
   */
  void setInteractable() {
    interactable = 1;
  }

  void setNotInteractable() {
    interactable = 0;
  }

};
