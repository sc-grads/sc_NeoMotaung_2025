using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fruit : MonoBehaviour
{
    public GameObject slicedFruitPrefab;
    public int scoreValue;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            //CreateSlicedFruit();
        }
    }
    
    public void CreateSlicedFruit()
    {
        GameObject inst = (GameObject)Instantiate(slicedFruitPrefab, transform.position, transform.rotation);

        FindObjectOfType<GameManager>().PlayRandomSliceSound();
        
        Rigidbody[] rbsOnSliced = inst.transform.GetComponentsInChildren<Rigidbody>();

        foreach(Rigidbody r in rbsOnSliced)
        {
            r.transform.rotation = Random.rotation;
            r.AddExplosionForce(Random.Range(500, 1000), transform.position, 5f);
        }

        FindObjectOfType<GameManager>().IncreaseScore(scoreValue);
        
        Destroy(inst.gameObject, 5);
        Destroy(gameObject);
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Blade bld = collision.GetComponent<Blade>();

        if (!bld)
        {
            return;
        }

        CreateSlicedFruit();
    }
}
