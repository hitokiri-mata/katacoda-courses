As you play the game look back at this watch to see how Kubernetes is resisting the chaos of the dying alien pods.

`watch kubectl get deployments --all-namespaces -l app-purpose=chaos`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Start playing the game and try to kill some alien Pods. As aliens are killed, come back to the watch in the terminal and see how Kubernetes is repairing the Pods.

## Game Play Keys

| Input           | Action                                                                                    |
|-----------------|-------------------------------------------------------------------------------------------|
|     space       | Fire! Apply chaos.                                                                        |
|     arrow keys  | Move you chaos ship and aim                                                               |
|     n           | Change namespace (you should define namespaces list. Ex: TARGET_NAMESPACE=foo1,foo2,foo3).|
|     a           | Switch to automatic mode.                                                                 |
|     m           | Switch to manual mode.                                                                    |
|     h           | Show special keys.                                                                        |
|     q           | Hide help for special keys.                                                               |
|     i           | Show pod's name. Move the ship towards an alien.                                          |
