# Beat Saber Clone

## Overview
This project is a Beat Saber-inspired virtual reality game developed in Godot 4. In a rhythm-based VR environment, players use laser swords to destroy cubes that fly toward them. This project replicates Beat Saber's core mechanics while allowing room for creativity and additional features.

## Gameplay Mechanics
### Laser Swords
- Constructed for each controller with a line renderer and ColliderShape extending along the negative Z-axis.
- Toggle visibility with the primary button on each controller ("A" for the right controller and "X" for the left controller).
- Lasers measure approximately 1 meter long.
- Lasers only interact with cubes when "on."

### Cubes
- A single cube spawns at the far end of the environment (10+ meters away) and moves toward the player's start position.
- Cubes can be destroyed by hitting them with the appropriately colored laser sword.
- Destroyed cubes trigger a sound effect.
- Cubes that go past the player are automatically destroyed without sound effects.

### CubeSpawner
- Creates cubes at random time intervals between 0.5 and 2.0 seconds.
- Cubes spawn with random X and Y positions, but always within reach of the laser swords.
- Cubes have a randomly assigned color that matches one of the laser swords.
- Only cubes hit by the laser sword with the same color are destroyed.

### Colors
- Left laser sword: Red
- Right laser sword: Blue
- Cubes are randomly assigned one of these two colors.

## Bonus Features
1. **Rhythm Game Mechanics**
   - Added music to the scene.
   - Modified CubeSpawner to spawn cubes based on beats of the music.
   - Includes a 20-30 second gameplay sequence synchronized with the track.

2. **Directional Cubes**
   - Cubes have a texture indicating a direction (up, down, left, or right).
   - The sword swing must match the indicated direction to destroy the cube.

3. **Cube Decomposition**
   - Destroyed cubes decompose into several smaller blocks that scatter and disappear.
   - These smaller blocks are non-interactable.

## Setup Instructions
### Prerequisites
- [Godot 4](https://godotengine.org/)
- VR headset (e.g., Meta Quest 2) with appropriate setup for Godot.

### Cloning the Repository
```bash
git clone https://github.com/adityasankranthi/beatsaber-clone.git
cd beatsaber-clone
```

### Running the Project
1. Open the project in Godot 4.
2. Ensure your VR headset is connected and properly configured.
3. Run the project to start the game.

### Exporting the APK
1. Configure the export settings for Android in Godot.
2. Export the APK and install it on your VR headset using SideQuest.

## Third-Party Assets
- **Sound Effects:** Hit sound effects from [Mixkit](https://mixkit.co/free-sound-effects/hit/).

## Acknowledgements
This project is a modified version of an assignment from a class taught by Professor Evan Suma Rosenberg at the University of Minnesota.
