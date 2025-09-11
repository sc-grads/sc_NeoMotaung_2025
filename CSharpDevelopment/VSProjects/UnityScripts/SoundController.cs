using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundController : MonoBehaviour {

	public AudioSource vertWallSound;
	public AudioSource sideWallSound;
	public AudioSource racketSound;

	private void OnCollisionEnter2D(Collision2D col)
	{
		if (col.gameObject.name == "RacketPlayerOne" || col.gameObject.name == "RacketPlayerTwo") {
			this.racketSound.Play ();
		} else if (col.gameObject.name == "wallTop" || col.gameObject.name == "wallBottom") {
			this.vertWallSound.Play ();
		} else {
			this.sideWallSound.Play ();
		}
	}

}
