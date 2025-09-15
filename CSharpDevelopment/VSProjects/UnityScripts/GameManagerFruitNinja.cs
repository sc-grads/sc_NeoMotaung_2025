using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    [Header ("Score Elements")]
    public int score;
    public TextMeshProUGUI scoreText;
    public int highscore;
    public TextMeshProUGUI highScoreText;

    [Header("GameOver")]
    public GameObject gameOverPanel;
    public TextMeshProUGUI gameOverScoreText;
    public TextMeshProUGUI gameOverHighScoreText;

    [Header("Sounds")]
    public AudioClip[] sliceSounds;
    private AudioSource audioSource;

    private void Awake()
    {
        gameOverPanel.SetActive(false);
        audioSource = GetComponent<AudioSource>();
        getHighScore();
    }

    private void getHighScore()
    {
        highscore = PlayerPrefs.GetInt("Highscore");
        highScoreText.text = "Best: " + highscore.ToString();
    }

    public void IncreaseScore(int point)
    {
        score += point;
        scoreText.text = score.ToString();

        if (score > highscore)
        {
            PlayerPrefs.SetInt("Highscore", score);
            highScoreText.text = "Best: " + score.ToString();
        }
    }

    public void OnBombHit()
    {
        Time.timeScale = 0;

        gameOverScoreText.text = "Score: " + score.ToString();
        gameOverHighScoreText.text = "Highest Score: " + highscore.ToString();

        gameOverPanel.SetActive(true);

        Debug.Log("Bomb was hit");
    }

    public void RestartGame()
    {
        score = 0;
        scoreText.text = score.ToString();

        gameOverPanel.SetActive(false);
        //gameOverScoreText.text = "Score: 0";

        foreach (GameObject g in GameObject.FindGameObjectsWithTag("Interactable"))
        {
            Destroy(g);
        }
        
        Time.timeScale = 1;
    }

    public void PlayRandomSliceSound()
    {
        AudioClip randomSound = sliceSounds[Random.Range(0, sliceSounds.Length)];
        audioSource.PlayOneShot(randomSound);
    }
}
